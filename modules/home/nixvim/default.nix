{ inputs, ... }: {
  imports =[
    inputs.nixvim.homeModules.nixvim
    ./options.nix
    ./ui.nix
    ./keymaps.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    globals.mapleader = " ";
  };
}
