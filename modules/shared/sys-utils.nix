{ pkgs, ... }:
{
  programs.neovim = {
      enable = true;
      package = pkgs.neovim-unwrapped;
      viAlias = true;
      vimAlias = true;
  };

  environment.systemPackages = with pkgs; [
    sops
    git
    curl
    wget
    unzip
    p7zip
    jq
    file
    killall
    hwinfo
    pciutils
    usbutils
    parted
    smartmontools
  ];
}
