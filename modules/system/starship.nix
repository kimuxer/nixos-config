{ ... }:

{
  programs.bash.blesh.enable = true;
  
  programs.starship = {
    enable = true;
    presets = [ "nerd-font-symbols" ];

    settings = {
      "$schema" = "https://starship.rs/config-schema.json";
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
    };
  };
}