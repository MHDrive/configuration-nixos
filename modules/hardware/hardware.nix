{config, lib, pkgs, ... }:

{
    hardware = {
        enableRedistributableFirmware = true;
        # enableAllFirmware = true;
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
            # enable32Bit = true;
            extraPackages = with pkgs; [
                intel-media-driver
                intel-vaapi-driver         # VAAPI driver for older Intel GPUs
                libva-vdpau-driver        # VDPAU driver for VAAPI
                libvdpau-va-gl            # VDPAU implementation using OpenGL under the hood
                nvidia-vaapi-driver       # NVIDIA VAAPI support
                vpl-gpu-rt
            ];
            # extraPackages32 = with pkgs.driversi686Linux; [
            #     intel-vaapi-driver
            #     libva-vdpau-driver  
            #     libvdpau-va-gl
            # ];
        };
        nvidia = {
            package = config.boot.kernelPackages.nvidiaPackages.legacy_535;
            modesetting.enable = true;
            # Power management features
            powerManagement = {
                enable = true;
                finegrained = true;  # Better power management
            };
            # Only available from driver 515.43.04+
            open = false;
            nvidiaSettings = true;
            prime = {
                offload = {
                    enable = true;
                    enableOffloadCmd = true;
                };

                intelBusId = "PCI:0:2:0";  
                nvidiaBusId = "PCI:1:0:0"; 
            };
        };
    };
}
