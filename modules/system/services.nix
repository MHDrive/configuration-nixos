{ config, pkgs, ... }:

{
    services = {
        xserver = {
            # Enable the X11 windowing system.
            enable = true;
            # Enable the GNOME Desktop Environment.
            displayManager = {
                # gdm.enable = true;
                # gdm.wayland = true;
                lightdm.greeters.gtk.theme = {
                    name = "Breeze-Dark";
                    package = pkgs.kdePackages.breeze-gtk;
                };

            };
            # desktopManager = {
            #     gnome.enable = true;
            # };
            # Configure keymap in X11
            xkb = {
                layout = "us";
                variant = "";
            };

            videoDrivers = [ "intel" "nvidia" ];
            # videoDrivers = [ "intel" "nvidia" ];
        };
        displayManager = {
            sddm = {
                enable = true;
                wayland.enable = true;
            };
        };
        desktopManager = {
            plasma6.enable = true;
        };
        # Enable CUPS to print documents.
        printing.enable = true;
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            # If you want to use JACK applications, uncomment this
            #jack.enable = true;

            # use the example session manager (no others are packaged yet so this is enabled by default,
            # no need to redefine it in your config for now)
            #media-session.enable = true;
        };
        # Enable touchpad support (enabled default in most desktopManager).
        # services.xserver.libinput.enable = true;

        # List services that you want to enable:

        # Enable the OpenSSH daemon.
        openssh.enable = true;
        flatpak.enable = true;
        
        nginx = {
            enable = true;
            user = "mh";
            group = "users";
            virtualHosts."~^(?<domain>.+)\\.test$" = {
                listen = [{ addr = "127.0.0.1"; port = 80; }];
                serverName = "~^(?<domain>.+)\\.test$";
                root = "/srv/Web/$domain";
                # root = "/srv/Web/$domain/public";
                locations."/" = {
                    index = "index.php index.html index.htm";
                    # tryFiles = "$uri $uri/ /index.php?$query_string";
                    tryFiles = "public/$uri /public/$uri/ $uri $uri/ public/index.php?$query_string /index.php?$query_string";
                    # extraConfig = ''
                    #     autoindex on;
                    #     charset utf-8;
                    # '';
                    extraConfig = ''
                        charset utf-8;
                    '';
                    # return = "404 /index.php";
                };

                # Disable access log and suppress not found log for favicon.ico and robots.txt
                # locations."/favicon.ico" = {
                #     extraConfig = ''
                #         access_log off;
                #         log_not_found off;
                #     '';
                # };

                # locations."/robots.txt" = {
                #     extraConfig = ''
                #         access_log off;
                #         log_not_found off;
                #     '';
                # };
                # locations."~ \.php$" = {
                locations."~ \.php$" = {
                    extraConfig = ''
                        fastcgi_split_path_info ^(.+\\.php)(/.+)$;
                        fastcgi_pass unix:/run/phpfpm/mypool.sock;
                        fastcgi_index index.php;
                        include ${pkgs.nginx}/conf/fastcgi_params;
                        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                    '';
                };
                # locations."~ /\.(?!well-known).*" = {
                #     extraConfig = "deny all;";
                # };
            };
        };

        # Konfigurasi DNSMasq
        dnsmasq = {
            enable = true;
            settings = {
                address = "/test/127.0.0.1";
                local = "/test/";
                domain = "test";
            };
        };

        # Setup MySQL
        mysql = {
            enable = true;
            package = pkgs.mysql80;
        };

        # Setup PHP FPM
        phpfpm.pools.mypool = {
            user = "mh";
            group = "users";
            settings = {
                "pm" = "dynamic";
                "listen.owner" = config.services.nginx.user;
                "pm.max_children" = 5;
                "pm.start_servers" = 2;
                "pm.min_spare_servers" = 1;
                "pm.max_spare_servers" = 3;
                "pm.max_requests" = 500;
            };
        };

    };
    
}