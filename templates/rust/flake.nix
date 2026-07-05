{
  description = "Rust development template with Fenix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, fenix }:
    let
      system = "x86_64-linux";
      # 在 pkgs 中引入 fenix 的 overlay
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ fenix.overlays.default ];
      };

      # 定义你想要的 Rust 工具链
      # 这里使用了 stable 版本，你也可以改为 fenix.minimal 或 fenix.nightly
      toolchain = pkgs.fenix.stable.withComponents [
        "cargo"
        "clippy"
        "rust-src"
        "rustc"
        "rustfmt"
      ];
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          toolchain
          pkgs.rust-analyzer-nightly
        ];

        # 使用 fenix 提供的工具链后，RUST_SRC_PATH 通常会自动配置，
        # 但如果 IDE 有需求，可以显式指定：
        #RUST_SRC_PATH = "${toolchain}/lib/rustlib/src/rust/library";
      };
    };
}
