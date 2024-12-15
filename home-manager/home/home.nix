{ pkgs, ... }:

{
    home = {
        username = "mh";
        homeDirectory = "/home/mh";
        packages = with pkgs; [
            thunderbird
            htop
        ];
        stateVersion = "24.11";
    };
}