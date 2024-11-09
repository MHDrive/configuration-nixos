{ ... }:

{
    # Bootloader.
    boot = {
        # kernel = {
        #     sysctl."net.ipv6.conf.eth0.disable_ipv6" = true;
        # };
        loader = {
            systemd-boot = {
                enable = true;
                # Boot membatasi jummlah generasi sistem
                configurationLimit = 7;
            };
            efi.canTouchEfiVariables = true;
        };
    };
}