{ inputs, ... }:
let
  diskid = "/dev/disk/by-id/nvme-Samsung_SSD_980_PRO_1TB_S6XXXXXX";
  commonOptions = [ "noatime" "compress=zstd" "space_cache=v2" "commit=120" ];
in
{
  imports = [ inputs.disko.nixosModules.disko ];

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
              mountOptions = [ "umask=0077" ];
            };
          };

          root = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ];
              subvolumes = {
                "@" = { mountpoint = "/"; mountOptions = commonOptions; };
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
