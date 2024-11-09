{config, lib, ... }:

{
    hardware = {
        cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

        # Enable sound with pipewire.
        pulseaudio.enable = false;
    };
}