{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    extraPackages = [ pkgs.jj-starship ];
    enableTransience = true;
    presets = [ "nerd-font-symbols" ];

    settings = {
      git_branch.disabled = true;
      git_status.disabled = true;
      add_newline = false;

      username = {
        show_always = false;
        style_root = "bold red";
      };

      directory = {
        style = "bold cyan";
        truncation_length = 1;
      };

      hostname.disabled = true;

      custom.jj = {
        when = "jj-starship detect";
        shell = [ "jj-starship" ];
        format = "$output ";
      };
    };
  };
}
