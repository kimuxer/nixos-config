git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs

~/.config/emacs/bin/doom install
~/.config/emacs/bin/doom sync


1. git clone` 到 `~/.config/emacs`。
2. 添加 `~/.config/emacs/bin` 到你的 Fish `PATH`。
3. 运行 `doom install`，把配置文件生成到 `~/.config/doom`。
4. 运行 `doom doctor`，确保所有勾都是绿的。
5. **关键步骤**：把生成的 `init.el` 等文件从 `~/.config/doom` 复制到 `modules/home/emacs/config/`。删除 `~/.config/doom`，在 `modules/home/emacs/default.nix` 中添加 `home.file` 映射，确保只有 `modules/home/emacs/config/` 中的配置文件被使用。
6. rebuild NixOS，确保 Doom Emacs 配置生效。
