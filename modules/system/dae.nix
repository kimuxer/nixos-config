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
        auto_config_kernel_parameter: true
        dial_mode: domain
        sniffing_timeout: 50ms                
        tls_implementation: utls
        utls_imitate: chrome_auto
      }

      dns {
        upstream {
          alidns: 'udp://223.5.5.5:53'
          googledns: 'tcp://8.8.8.8:53'
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
        vps_vless: "${config.sops.placeholder."nodes/vless"}"
        vps_hy2: "${config.sops.placeholder."nodes/hy2"}"
        vps_tuic: "${config.sops.placeholder."nodes/tuic"}"
        vps_anytls: "${config.sops.placeholder."nodes/anytls"}"
        vps_vmess: "${config.sops.placeholder."nodes/vmess"}"
        vps_naive: "socks5://127.0.0.1:55555"
      }

      group {
        master_group {
          policy: min_moving_avg
          check_tolerance: 50ms 
          tcp_check_url: 'http://cp.cloudflare.com/generate_204'
          check_interval: 20s
    
          # 策略权重：通过延迟偏移（Offset）实现“协议分层”
          # 即使 VLESS 物理延迟比 HY2 低，我们也强制优先走 HY2
          filter: name(vps_hy2) [add_latency: -30ms]
          filter: name(vps_tuic) [add_latency: -10ms]
          filter: name(vps_vless) [add_latency: -20ms]
          filter: name(vps_anytls) [add_latency: -20ms]
          filter: name(vps_vmess) [add_latency: 0ms]
          filter: name(vps_naive) [add_latency: 0ms]
        }

        # 备用组：绝对防线
        #emergency_group {
        #  policy: fixed(0)
        #  filter: name(vps_naive)
        #}
      }

      routing {
        ### [级别1] 内核/系统级直连（不可动）
        dip(224.0.0.0/3, 'ff00::/8') -> direct
        pname(NetworkManager, systemd-resolved) -> direct(must)
        dip(geoip:private) -> direct(must)
        
        ### [级别2] 逃逸与防环区（优先级必须提到最高）
        # 必须确保在代理开始工作前，先排除节点自身的地址
        dip("${config.sops.placeholder.vps_ip}") -> direct
        domain(suffix: ${config.sops.placeholder.vps_domain}) -> direct

        ### [级别3] 强制业务区
        pname(termusic, yt-dlp) -> master_group
        domain(suffix: google-analytics.com) -> master_group

        ### [级别4] 智能分流区
        # 针对 DNS 的精细化管理：只代理非 cn 的 DNS 查询
        # 确保 dae 自身的 DNS 流量不会产生“鸡生蛋，蛋生鸡”的环路
        dip(223.5.5.5) -> direct
        dport(53) && !dip(223.5.5.5) -> master_group

        # 常规地理分流
        domain(geosite:cn) -> direct
        dip(geoip:cn) -> direct
        
        # 业务组分流（利用我们定义的带健康探测的分组）
        domain(geosite:google, geosite:youtube, geosite:github) -> master_group

        ### [级别5] 终极兜底
        fallback: master_group
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
