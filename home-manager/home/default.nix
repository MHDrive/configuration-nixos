{ pkgs, ... }:

{
    home = {
        username = "mh";
        homeDirectory = "/home/mh";
        packages = with pkgs; [
            # archives
            zip
            unzip
            p7zip

            # offices
            # libreoffice
            thunderbird

            bat
        ];
        stateVersion = "24.05";
    };
}