
{ pkgs, ... }:

{
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
        # unitilis
        pciutils
        lshw

        # archives
        zip
        unzip
        p7zip
        git
        vscode
        bindfs
        flatpak
        curl
        devenv
        direnv
        gnome-tweaks
        gnome-shell-extensions
        gnomeExtensions.weather-oclock
        gnomeExtensions.dash-to-dock
        gnomeExtensions.blur-my-shell
        gnomeExtensions.appindicator
        ntfs3g
        bat
        php83
        php83Packages.composer

        intel-compute-runtime
    ];
    # Exclude GNOME default apps
    environment.gnome.excludePackages = with pkgs; [
        geary
        epiphany
        gnome-music
    ];

    # environment.variables = {
    #     LIBVA_DRIVER_NAME = "iHD";
    # };
}