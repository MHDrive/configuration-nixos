{ config, pkgs, ... }:

{
    boot = {
        initrd = {
            availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "rtsx_usb_sdmmc" ];
            kernelModules = [ "i915" ];
        };
        # kernelModules = [ "kvm-intel" ];
        kernelModules = [ "kvm-intel" "nvidia" "nvidia_modeset" "nvidia_drm" "nvidia_uvm" ];
        extraModulePackages = [ ];
        blacklistedKernelModules = ["nouveau"];
        # kernelParams = [
        #    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
        #    "nvidia.NVreg_RegistryDwords=PowerMizerEnable=0x1"
        # ];
    };
}
