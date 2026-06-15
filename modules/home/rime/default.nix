# /home/kim/nixos/modules/home/rime/default.nix
{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-rime
      ];
    };
  };

  # 安装wubi_pinyin
  home.file = {
    ".local/share/fcitx5/rime/pinyin_simp.schema.yaml".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/rime/rime-pinyin-simp/refs/heads/master/pinyin_simp.schema.yaml";
      sha256 = "sha256-cmdyGQoyWuS/I2kV59YqI/7djPHainQ3CiD4cZbGd3U=";
    };

    ".local/share/fcitx5/rime/wubi_pinyin.schema.yaml".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/rime/rime-wubi/master/wubi_pinyin.schema.yaml";
      sha256 = "sha256-KcjP/Fe7HhF5JyuZ2TI3Jt4J5TMedI+0oC1G0SE+q+g=";
    };

    ".local/share/fcitx5/rime/wubi86.dict.yaml".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/rime/rime-wubi/master/wubi86.dict.yaml";
      sha256 = "sha256-+DPYa3I0H+guBppCW2Yl8p74XxvA809vt5df5RSIi1o=";
    };

    ".local/share/fcitx5/rime/wubi86.schema.yaml".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/rime/rime-wubi/master/wubi86.schema.yaml";
      sha256 = "sha256-zbWqwamqBxVS1f3/3+WmYYtCmxk1i4seADEw6DXVoWY=";
    };

    ".local/share/fcitx5/rime/wubi_trad.schema.yaml".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/rime/rime-wubi/master/wubi_trad.schema.yaml";
      sha256 = "sha256-pG9BbH1nkWo13lS3LiNrU8IoHamrQ57sC1to2zB495Q=";
    };
    ".local/share/fcitx5/rime/default.custom.yaml".text = ''
      patch:
        style:
          - horizontal: false
        schema_list:
          - schema: wubi_pinyin  # 启用五笔拼音
    '';
  
    # 强制 Fcitx5 的皮肤候选词菜单变为竖排
    ".config/fcitx5/conf/classicui.conf".text = ''
      # 候选词列表方向 (Vertical 或 Horizontal)
      Vertical Candidate List=True
    '';
  };
}
