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
        nvidia = {
            prime = {
                intelBusId = "PCI:0:2:0";  
                nvidiaBusId = "PCI:1:0:0"; 
            };
            modesetting.enable = true;
            powerManagement.enable = false;
            powerManagement.finegrained = false;
            # Only available from driver 515.43.04+
            open = false;
            nvidiaSettings = true;
            package = config.boot.kernelPackages.nvidiaPackages.legacy_535;
        };
    };
}