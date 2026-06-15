{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    profiles.default = {
      name = "default";
      isDefault = true;

      settings = {
        # 极简 UI
        "browser.startup.page" = 1;
        "browser.startup.homepage" = "https://github.com";
        "browser.tabs.inTitlebar" = 1;
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.uidensity" = 1;
        "extensions.autoDisableScopes" = 0;

        # 性能与隐私
        "network.trr.mode" = 2;
        "browser.search.suggest.enabled" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      # 自定义 CSS 完美隐藏顶部标签栏与侧边栏页眉，完美适配侧边栏标签插件
      userChrome = ''
        #TabsToolbar {
          position: absolute !important;
          visibility: collapse !important;
        }
        #sidebar-box #sidebar-header {
          display: none !important;
        }
      '';

      # 高级搜索（极其方便，在地址栏输入 @np 即可搜包）
      search = {
        force = true;
        default = "Google";
        engines = {
          "Nix Packages" = {
            urls = [{ template = "https://search.nixos.org/packages?query={searchTerms}"; }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
        };
      };
    };
  };
}
