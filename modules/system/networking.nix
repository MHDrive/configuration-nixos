{ ... }:

{
    networking = {
        # Define hostName
        hostName = "nixos-mh";
        # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

        # Configure network proxy if necessary
        # proxy.default = "http://user:password@proxy:port/";
        # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
        
        # Enable networking
        networkmanager.enable = true;
        # Open ports in the firewall.
        # firewall.allowedTCPPorts = [ ... ];
        # firewall.allowedUDPPorts = [ ... ];
        # Or disable the firewall altogether.
        firewall = {
            enable = true;
            allowedTCPPorts = [ 80 443 3306 ]; # Allow HTTP, HTTPS, MariaDB
            allowedUDPPortRanges = [
                {
                    from = 40000;
                    to = 50000;
                }
            ];
        };
        # hosts = {
        #     "127.0.0.1" = [
        #         "php.local.com"
        #     ];
        # };
        networkmanager.insertNameservers = [ "127.0.0.1" ];  # Gunakan dnsmasq sebagai DNS lokal

        # interfaces.eth0.ipv4.addresses = [ {
        #     address = "192.168.1.2";
        #     prefixLength = 24;
        # } ];
        # defaultGateway = "192.168.1.1";
        # nameservers = [ "8.8.8.8" ];
        
        
    };
}