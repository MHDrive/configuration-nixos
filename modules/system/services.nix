{ config, pkgs, ... }:

# Definisikan konfigurasi nginx dan let binding di luar blok utama
# let
#   mkVHost = domain: {
#     listen = [{ addr = "127.0.0.1"; port = 80; }];
#     serverName = "${domain}.test";
#     # root = if builtins.pathExists "/srv/${domain}/public" && builtins.pathExists "/srv/${domain}/artisan" 
#     #        then "/srv/${domain}/public" else "/srv/${domain}";
#     root = "/srv/${domain}";
#     locations."~ \\.php$" = {
#       extraConfig = ''
#         fastcgi_split_path_info ^(.+\\.php)(/.+)$;
#         fastcgi_pass unix:/run/phpfpm/mypool.sock;
#         fastcgi_index index.php;
#         include ${pkgs.nginx}/conf/fastcgi_params;
#         fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
#       '';
#     };
#     locations."/" = {
#       index = "index.php index.html index.htm";
#       tryFiles = "$uri $uri/ /index.php?$query_string";
#       extraConfig = ''
#         autoindex on;
#       '';
#     };
#   };
# in
{

    services = {
        xserver = {
            # Enable the X11 windowing system.
            enable = true;
            # Enable the GNOME Desktop Environment.
            displayManager = {
                gdm.enable = true;
            };
            desktopManager = {
                gnome.enable = true;
            };
            # Configure keymap in X11
            xkb = {
                layout = "us";
                variant = "";
            };

            videoDrivers = [ "nvidia" ];
            # videoDrivers = [ "intel" "nvidia" ];
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
        # httpd = {
        #     enable = true;
        #     adminAddr = "localhost";
        #     enablePHP = true;
        #     group = "users";
        #     phpPackage = pkgs.php83;
        #     phpOptions = ''
        #         date.timezone = "Asia/Makassar";
        #         display_errors = on;
        #         upload_max_filesize = "100M";
        #         post_max_size = "100M";
        #     '';
        #     user = "mh";
        #     virtualHosts."localhost" = {
        #         documentRoot = "/home/mh/Developments/Web/htdocs";
        #         locations."/".index = "index.php index.html";
        #         extraConfig = ''
        #             <Directory "/home/mh/Developments/Web/htdocs">
        #                 AllowOverride All
        #                 Require all granted
        #             </Directory>
        #         '';
        #     };
        # };

        # nginx = {
        #     enable = true;
        #     virtualHosts."php.local.com" = {
        #         root = "/srv/php";
        #         # Anda bisa mengaktifkan blok ini jika ingin mengatur index:
        #         locations."/" = {
        #           index = "index.php index.html index.htm";
        #         };
        #         locations."~ \\.php$".extraConfig = ''
        #         fastcgi_pass unix:/run/phpfpm/mypool.sock;
        #         fastcgi_index index.php;
        #         '';
        #     };
        # };

        nginx = {
            enable = true;
            user = "mh";
            group = "users";
            virtualHosts."~^(?<domain>.+)\\.test$" = {
                listen = [{ addr = "127.0.0.1"; port = 80; }];
                serverName = "~^(?<domain>.+)\\.test$";
                
                # Direktori root yang dinamis, bisa juga menggunakan symlink jika ada beberapa folder
                # root = "/home/mh/Developments/Web/$domain";
                root = "/srv/Web/$domain";
                # root = if builtins.pathExists "/srv/$domain/artisan" && builtins.pathExists "/srv/$domain/public" then "/srv/$domain/public" else "/srv/$domain";
                # root = if builtins.pathExists "/srv/$domain/public" then "/srv/$domain/public" else "/srv/$domain";
                locations."~ \\.php$" = {
                    extraConfig = ''
                        fastcgi_split_path_info ^(.+\\.php)(/.+)$;
                        fastcgi_pass unix:/run/phpfpm/mypool.sock;
                        fastcgi_index index.php;
                        include ${pkgs.nginx}/conf/fastcgi_params;
                        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                    '';
                };
                locations."/" = {
                    index = "index.php index.html index.htm";
                    # tryFiles = "$uri $uri/ /index.php?$query_string";
                    tryFiles = "/public$uri /public$uri/ $uri $uri/ /public/index.php?$query_string /index.php?$query_string";
                    extraConfig = ''
                        autoindex on;
                    '';
                };
            };
        };

        # nginx = {
        #     enable = true;
        #     virtualHosts = builtins.listToAttrs (map (domain: { name = domain; value = mkVHost domain; }) [
        #         "site1" "site2" "site3"
        #     ]);
        # };

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

# phpfpm = {
        #     pools.php83 = {
        #         user = "nginx";
        #         settings = {
        #         "listen.owner" = config.services.nginx.user;
        #         "pm" = "dynamic";
        #         "pm.max_children" = 32;
        #         "pm.start_servers" = 2;
        #         "pm.min_spare_servers" = 2;
        #         "pm.max_spare_servers" = 4;
        #         "pm.max_requests" = 500;
        #         };
        #         phpPackage = pkgs.php83;
        #     };
        # };

# nginx = {
        #     enable = true;
        #     virtualHosts."*.test" = {
        #         root = "/home/mh/Developments";
        #         locations."~ \\.php$".extraConfig = ''
        #             fastcgi_pass unix:${config.services.phpfpm.pools.mypool.socket};
        #             fastcgi_index index.php;
        #         '';
        #         # Mengarahkan semua permintaan yang tidak ditemukan ke index.php (untuk aplikasi seperti Laravel)
        #         locations."/".extraConfig = ''
        #             try_files $uri $uri/ /index.php?$query_string;
        #         '';
        #     }; 
        # };

        # nginx = {
        #     enable = true;
        #     recommendedGzipSettings = true;
        #     recommendedOptimisation = true;
        #     recommendedProxySettings = true;
        #     recommendedTlsSettings = true;
        #     virtualHosts."blog.example.com" = {
        #         # enableACME = true;
        #         # forceSSL = true;
        #         root = "/var/www/blog";
        #         locations."~ \\.php$" = {
        #             extraConfig = ''
        #                 fastcgi_pass  unix:/run/phpfpm/php83.sock;
        #                 fastcgi_index index.php;
        #             '';
        #         };
        #     };
        # };

        # Enable thermald for CPU temperature auto handling
        # thermald.enable = true;

        # # Enable throttled.service for fix Intel CPU throttling
        # throttled.enable = true;