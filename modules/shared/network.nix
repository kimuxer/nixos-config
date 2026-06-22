    { ... }: {
      boot.kernel.sysctl = {
        # BBR 和 Buffer 优化（对所有机器都好）
        "net.core.default_qdisc" = "fq";
        "net.ipv4.tcp_congestion_control" = "bbr";
        "net.core.rmem_max" = 16777216;
        "net.core.wmem_max" = 16777216;
      };
    }
