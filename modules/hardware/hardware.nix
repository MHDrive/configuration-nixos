{config, lib, pkgs, ... }:

{
    hardware = {
        # enableRedistributableFirmware = true;
        enableAllFirmware = true;
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
            driSupport = true;
            # enable32Bit = true;
            driSupport32Bit = true;  # Needed for Steam games
            extraPackages = with pkgs; [
                intel-media-driver
                vaapiIntel
                vaapiVdpau
                libvdpau-va-gl
                nvidia-vaapi-driver    # NVIDIA VAAPI support

                # intel-media-driver
                # intel-vaapi-driver
                # vaapiVdpau
                # libvdpau-va-gl

                # intel-media-driver
                # intel-compute-runtime
                # vpl-gpu-rt
            ];
            # extraPackages32 = with pkgs.driversi686Linux; [
            #     intel-media-driver
            # ];
        };
        nvidia = {
            package = config.boot.kernelPackages.nvidiaPackages.legacy_535;
            # package = config.boot.kernelPackages.nvidiaPackages.stable;
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
            forceFullCompositionPipeline = true;
        };
    };
}