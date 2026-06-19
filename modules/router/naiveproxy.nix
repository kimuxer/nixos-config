{ config, pkgs, lib, ... }:

let
  proxySecrets = ../../secrets/proxy.yaml;
  # 1. 免编译预构建包
  naiveproxy-bin = pkgs.stdenv.mkDerivation rec {
    pname = "naiveproxy";
    version = "149.0.7827.114-1";

    src = pkgs.fetchurl {
      url = "https://github.com/klzgrad/naiveproxy/releases/download/v${version}/naiveproxy-v${version}-linux-x64.tar.xz";
      hash = "sha256-izCOa1VBJ7XrxbtcemznfLSBqo1nvFhDgZcE0jrndzo=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    # 自适应提取二进制
    installPhase = ''
      find . -type f -name "naive" -exec install -Dm755 {} $out/bin/naive \;
    '';
  };

  # ⚡ 静态参数绑定：直接在内部决定你的本地监听端口为 55555
  listenPort = "socks://127.0.0.1:55555";
in
{
  # 1. 放入系统环境以便命令行随时可以调用调试
  environment.systemPackages = [ naiveproxy-bin ];

  # 2. 并在运行期将所有人限制为 naiveproxy，保证安全
  sops.secrets.naive_proxy = {
    sopsFile = proxySecrets;
    owner = "naiveproxy";
    group = "naiveproxy";
  };

  sops.templates."naiveproxy.json" = {
    content = ''
      {
        "listen": "${listenPort}",
        "proxy": "${config.sops.placeholder.naive_proxy}"
      }
    '';
    owner = "naiveproxy";
    group = "naiveproxy";
  };

  # 3. 声明 Systemd 服务（只要导入此模块，服务便会默认静默启用并开机自启）
  systemd.services.naiveproxy = {
    description = "NaiveProxy Client Service";
    after = [ "network.target" "sops-nix.service" ];
    wants = [ "sops-nix.service" ];
    wantedBy = [ "multi-user.target" ];
    before = [ "dae.service" ]; # ⚡ 严格时序保证

    serviceConfig = {
      Type = "simple";
      # 动态读取解密出的 proxy 链接并直接启动
      ExecStart = "${naiveproxy-bin}/bin/naive ${config.sops.templates."naiveproxy.json".path}";
      Restart = "on-failure";
      RestartSec = 5;

      # 权限降级，安全运行
      User = "naiveproxy";
      Group = "naiveproxy";
    };
  };
}
