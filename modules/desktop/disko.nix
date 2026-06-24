# -- modules/desktop/disko.nix --
{ ... }:
let
  diskid = "/dev/disk/by-id/ata-CT1000MX500SSD1_2138E5D33BCE";
  commonOptions = [ "defaults" "noatime" "compress=zstd" "space_cache=v2" "commit=120" ];
in
{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = diskid;
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            priority = 1;
            name = "ESP";
            size = "4G";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "defaults" "umask=0077" ];
            };
          };

          root = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ];
              subvolumes = {
                "@" = { mountpoint = "/"; mountOptions = commonOptions; };
                "@nix" = { mountpoint = "/nix"; mountOptions = commonOptions; };
                "@home" = { mountpoint = "/home"; mountOptions = commonOptions; };
                "@snapshots" = { mountpoint = "/home/.snapshots"; mountOptions = commonOptions; };
              };
            };
          };
        };
      };
    };
  };
}
