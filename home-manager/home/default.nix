{ pkgs, ... }:

{
    home = {
        username = "mh";
        homeDirectory = "/home/mh";
        packages = with pkgs; [
            # offices
            # libreoffice
            thunderbird
            htop
        ];
        stateVersion = "24.05";
    };
}