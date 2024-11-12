{ config, pkgs, ... }:

{
    boot = {
        initrd = {
            availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "rtsx_usb_sdmmc" ];
            kernelModules = [ ];
        };
        # kernelModules = [ "kvm-intel" ];
        kernelModules = [ "nvidia" "i915" "kvm-intel" ];
        # kernelModules = [ "kvm-intel" "nvidia" "nvidia_modeset" "nvidia_drm" "nvidia_uvm" ];
        extraModulePackages = [ ];
        # blacklistedKernelModules = ["nouveau"];
        # kernelParams = [
        #    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
        #    "nvidia.NVreg_RegistryDwords=PowerMizerEnable=0x1"
        # ];
    };
}
