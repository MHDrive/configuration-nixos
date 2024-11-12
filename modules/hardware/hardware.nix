{config, lib, pkgs, ... }:

{
    hardware = {
        enableRedistributableFirmware = true;
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
            enable32Bit = true;
            extraPackages = with pkgs; [
                # intel-media-driver
                # intel-vaapi-driver
                # vaapiVdpau
                # libvdpau-va-gl
                intel-media-driver
                intel-compute-runtime
                vpl-gpu-rt
            ];
            extraPackages32 = with pkgs.driversi686Linux; [
                intel-media-driver
            ];
        };
        nvidia = {
            # package = config.boot.kernelPackages.nvidiaPackages.legacy_535;
            package = config.boot.kernelPackages.nvidiaPackages.stable;
            modesetting.enable = true;
            powerManagement.enable = true;
            powerManagement.finegrained = false;
            # Only available from driver 515.43.04+
            open = false;
            nvidiaSettings = true;
            prime = {
                intelBusId = "PCI:0:2:0";  
                nvidiaBusId = "PCI:1:0:0"; 

                offload = {
                    enable = true;
                    enableOffloadCmd = true;
                };
            };
        };
    };
}