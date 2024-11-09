{ config, pkgs, ... }:

{
    services = {
        xserver = {
            # Enable the X11 windowing system.
            enable = true;
            # Enable the GNOME Desktop Environment.
            displayManager = {
                gdm.enable = true;
            };
            desktopManager = {
                gnome.enable = true;
            };
            # Configure keymap in X11
            xkb = {
                layout = "us";
                variant = "";
            };
        };
        # Enable CUPS to print documents.
        printing.enable = true;
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            # If you want to use JACK applications, uncomment this
            #jack.enable = true;

            # use the example session manager (no others are packaged yet so this is enabled by default,
            # no need to redefine it in your config for now)
            #media-session.enable = true;
        };
        # Enable touchpad support (enabled default in most desktopManager).
        # services.xserver.libinput.enable = true;

        # List services that you want to enable:

        # Enable the OpenSSH daemon.
        openssh.enable = true;
        flatpak.enable = true;

    };
}