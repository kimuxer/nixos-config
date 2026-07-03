# Neovim Configuration

本配置采用 **NixOS + Neovim 原生包管理 (`vim.pack`)** 的分层架构，旨在平衡系统的稳定性与配置的灵活性。

## 目录结构说明

```text
neovim/
├── default.nix       # Nix 模块：安装核心插件与开发工具链 (LSP, formatters 等)
└── nvim/             # Neovim 配置目录 (xdg.configFile 同步至 ~/.config/nvim)
    ├── init.lua      # 入口文件
    ├── lua/
    │   └── config/   # 全局配置
    │       ├── init.lua
    │       ├── keymaps.lua
    │       └── options.lua
    ├── plugin/       # 自动加载的插件配置 (按加载顺序)
    │   ├── 00-ui.lua
    │   ├── 01-lualine.lua
    │   ├── 02-diagnostic.lua
    │   ├── 03-treesitter.lua
    │   ├── 04-completion.lua
    │   ├── 05-telescope.lua
    │   ├── 06-formatting.lua
    │   ├── 07-direnv.lua
    │   ├── 08-whichkey.lua
    │   └── 09-lsp.lua
    └── after/
        ├── lsp/      # LSP 服务器配置
        │   ├── lua_ls.lua
        │   ├── nixd.lua
        │   └── rust_analyzer.lua
        └── ftplugin/ # 按文件类型自动加载 (LSP 与局部配置)
            ├── lua.lua
            ├── markdown.lua
            ├── nix.lua
            └── rust.lua
```

## 架构原则

1.  **基础设施层 (Nix)**: 复杂、带有编译依赖的插件 (如 `blink-cmp`, `nvim-treesitter`) 及系统级工具 (LSP 服务器、格式化工具) 由 `default.nix` 统一管理，确保环境一致性。
2.  **功能扩展层 (vim.pack)**: 轻量、纯 Lua 的功能性插件由 `vim.pack.add` 在 `plugin/` 目录中动态管理，实现按需配置与模块化。
3.  **懒加载层 (after/ftplugin)**: 利用 Neovim 原生机制，仅在打开特定语言文件时才激活对应的 LSP 服务器，最大限度降低启动延迟。

## 开发工作流

- **添加新插件**:
  - 若包含 Rust/C 编译依赖: 添加到 `default.nix` 的 `plugins` 列表中。
  - 若为纯 Lua 插件: 在 `nvim/plugin/` 下创建一个带序号的新文件（如 `09-xxx.lua`），使用 `vim.pack.add({...})`。
- **添加新语言支持**:
  - 在 `nvim/after/ftplugin/` 下添加对应的 `.lua` 文件，并设置 `vim.lsp.enable()`。
- **清理未使用插件**:
  - 从 Lua 定义中删除 `vim.pack.add` 行。
  - 重启 Neovim。
  - 执行 `:packdel ++all`。
- **更新插件**:
  - 执行 `:lua vim.pack.update()`。

## 维护提示

- `plugin/` 目录下的所有文件均按字母顺序自动加载，无需在 `init.lua` 中手动 `require`。
- `after/ftplugin/` 目录下的配置只在特定文件类型打开时生效，是实现“按需启动 LSP”的核心。
- `nvim-pack-lock.json` 可能不存在，根据你的配置方式，请确认是否使用类似机制管理插件。
