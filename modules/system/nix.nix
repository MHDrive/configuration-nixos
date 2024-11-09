{ config, ... }:

{
    nix = {
        # setting otomatis menghapus data generasi
        gc = {
            automatic = true;
            dates = "Mon,Fri *-*-* 00:00:00"; # delete setiap hari senin, jumat di tanggal 00
            options = "--delete-order-than 3d"; # delete order setelah 3 hari tidak digunakan
        };
        settings = {
            # Enable nix flakes
            experimental-features = [ "nix-command" "flakes" ];
            # Add yourself to the trusted-users
            trusted-users = [ "root" "mh" ];
            # subtituters = [ "devenv...." ];
            # trusted-public-keys = [ "devenv:...." ];
        };

    };
}