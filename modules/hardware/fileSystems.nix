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
        # Membindfs folder /etc/nixos ke dalam folder /home/user/.config/nixos
    fileSystems."/home/mh/.config/nixos" = 
    { 
        device = "/etc/nixos";
        fsType = "fuse.bindfs";
        options = [ "force-user=mh" "force-group=users" ]; # owner dan grup
    };
}