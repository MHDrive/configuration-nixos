{config, lib, pkgs, ... }:

{
    hardware = {
        cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

        # Enable sound with pipewire.
        pulseaudio.enable = false;

        # graphics
        #when using non-unstable
        # opengl = {
        #     enable = true;
        #     extraPackages = with pkgs; [
        #         intel-media-driver
        #         intel-vaapi-driver
        #         vaapiVdpau
        #         libvdpau-va-gl  
        #     ];
        # };
        # when using unstable
        graphics = {
            enable = true;
            extraPackages = with pkgs; [
                intel-media-driver
                intel-vaapi-driver
                vaapiVdpau
                libvdpau-va-gl
            ];
        };
    };
}