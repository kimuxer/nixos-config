# Rust Development Template

基于 Nix Flake 的 Rust 开发环境模板，开箱即用。

## 快速开始

1. **创建新项目**：
   ```bash
   mkdir -p ~/projects && cd ~/projects
   nix flake new -t ~/nixos-config#rust my-rust-project
   cd my-rust-project
   ```

2. **初始化环境**：
   ```bash
   direnv allow
   ```
   *(注意：确保你已在 NixOS 系统配置中启用了 `programs.direnv.enable = true`。)*

3. **初始化 Rust 项目**：
   ```bash
   cargo init .
   ```

## 环境说明

此模板提供了以下完整的 Rust 开发工具链：
- `rustc` & `cargo`: 核心编译工具
- `rust-analyzer`: IDE 语言服务器支持
- `rustfmt`: 代码格式化工具
- `clippy`: Rust 代码质量检查工具

此外，配置自动设置了 `RUST_SRC_PATH`，确保 `rust-analyzer` 能正确解析标准库源代码。

## 开发工作流

- **构建项目**: `cargo build`
- **运行项目**: `cargo run`
- **代码检查**: `cargo clippy`
- **格式化代码**: `cargo fmt`

## 常见问题

- **如何添加依赖？**
  直接运行 `cargo add <crate-name>` 即可，不需要修改 Nix 配置。
- **IDE 支持**：
  如果你使用 VS Code，安装 `rust-analyzer` 插件即可获得完整的智能提示支持。
