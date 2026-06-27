mkdir -p ~/projects && cd ~/projects && nix flake new -t ~/nixos-config#rust my-new-project-name
cd ~/projects/my-new-project-name
direnv allow
