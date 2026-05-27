{
  inputs,
  pkgs,
  config,
  ...
}:

{
  imports = [
    inputs.daeuniverse.nixosModules.dae
    inputs.sops-nix.nixosModules.sops
  ];

  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/var/lib/sops-nix/key.txt";

  sops.secrets.vps_ip = { };
  sops.secrets.vps_domain = { };
  sops.secrets."nodes/vless" = { };
  sops.secrets."nodes/hy2" = { };
  sops.secrets."nodes/tuic" = { };
  sops.secrets."nodes/anytls" = { };
  sops.secrets."nodes/vmess" = { };

  sops.templates."config.dae" = {
    content = ''
      global {
        lan_interface: auto
        wan_interface: auto
        log_level: info
        allow_insecure: false
        auto_config_kernel_parameter: true  # ⚡ 内核参数全能管家，接管一切转发与底层拓扑微调
        dial_mode: domain
        sniffing_timeout: 0                 # ⚡ 极致首包响应优化，免去无用嗅探扣留
        tls_implementation: utls            # ⚡ 强力安全伪装，模拟主流浏览器指纹，保护节点生存期
        utls_imitate: chrome_auto
      }

      dns {
        upstream {
          alidns: 'udp://223.5.5.5:53'
          googledns: 'tcp://8.8.8.8:53'    # ⚡ 硬编码 IP 建立安全 DoT 通道，斩断 DNS Bootstrap 环路
        }
        routing {
          request {
            qname(geosite:cn) -> alidns
            fallback: googledns
          }
        }
        ipversion_prefer: 4
      }

      node {
        # 注意：此处必须使用 ''${ 规避 Nix 编译期插值，保留给 sops-nix 在运行期替换
        vps_vless: "${config.sops.placeholder."nodes/vless"}"
        vps_hy2: "${config.sops.placeholder."nodes/hy2"}"
        vps_tuic: "${config.sops.placeholder."nodes/tuic"}"
        vps_anytls: "${config.sops.placeholder."nodes/anytls"}"
        vps_vmess: "${config.sops.placeholder."nodes/vmess"}"
      }

      group {
        proxy_group {
          policy: min                  # ⚡ 单节点锁定，杜绝无效测速引发的 connection reset
        }
      }

      routing {
        ### 1. 官方预设生存规则 (保护内网、绑定 WAN 的连通性检查)
        pname(NetworkManager, systemd-resolved, dnsmasq) -> direct(must)
        dip(224.0.0.0/3, 'ff00::/8') -> direct
        dip(geoip:private) -> direct
        dport(53) && !dip(223.5.5.5) -> proxy_group

        ### 2. 环境防御与环路死锁逃逸
        dip("${config.sops.placeholder.vps_ip}") -> direct
        domain(suffix: ${config.sops.placeholder.vps_domain}) -> direct

        domain(geosite:google, geosite:github) -> proxy_group
        domain(suffix: nixos.org, suffix: cachix.org) -> proxy_group

        ### 4. 智能分流与终极兜底
        domain(geosite:cn) -> direct
        dip(geoip:cn) -> direct
        fallback: proxy_group
      }
    '';
  };

  services.dae = {
    enable = true;
    package = inputs.daeuniverse.packages.${pkgs.stdenv.hostPlatform.system}.dae;
    assets = with pkgs; [
      v2ray-geoip
      v2ray-domain-list-community
    ];
    configFile = config.sops.templates."config.dae".path;
  };
}
