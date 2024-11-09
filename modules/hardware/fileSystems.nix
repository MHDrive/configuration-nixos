{ ... }:

{
    fileSystems."/" =
        { device = "/dev/disk/by-uuid/c03c23c1-ea59-4073-beae-2ab72e0b7e5e";
        fsType = "ext4";
        };

    fileSystems."/boot" =
        { device = "/dev/disk/by-uuid/5532-9207";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
        };

    fileSystems."/home" =
        { device = "/dev/disk/by-uuid/945103f8-b4c5-437b-96c8-97b57cee655f";
        fsType = "ext4";
        };
}