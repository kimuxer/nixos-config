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

          # 自定义 CSS 移除标题栏边距
          userChrome = ''
            #titlebar { display: none !important; }
            #TabsToolbar { margin-top: 0px !important; }
          '';

          # 高级搜索
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

          # 扩展
          extensions = with pkgs.firefox-addons; [
            ublock-origin
            darkreader
            bitwarden
          ];
        };
      };
    }
