
{ pkgs, ... }:

{
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        wget
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
        # gnome-shell
        # gnome-tweaks
        # gnome-shell-extensions
        # gnomeExtensions.weather-oclock
        # gnomeExtensions.dash-to-dock
        # gnomeExtensions.blur-my-shell
        # gnomeExtensions.appindicator
        ntfs3g
        bat
        php83
        php83Packages.composer

        intel-compute-runtime
        glxinfo
        nodejs_22
        zoom-us
        vlc
        ciscoPacketTracer8

        libreoffice-qt6-fresh
        #kde-plasma6
        kdePackages.kdeplasma-addons
        kdePackages.qtwebengine

        pcsx2
        jstest-gtk
        usbutils

        # libva
        # libvdpau
    ];
    # Exclude GNOME default apps
    # environment.gnome.excludePackages = with pkgs; [
    #     geary
    #     epiphany
    #     gnome-music
    # ];

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
        elisa
    ];
}
