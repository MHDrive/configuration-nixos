{ lib, pkgs, ... }:

{
    programs = {
        fastfetch = import ./fastfetch.nix;
        bash = import ./bash.nix;
        starship = import ./starship.nix;
        git = {
            enable = true;
            userName = "Muhammad Hamdi";
            userEmail = "hamdj360@gmail.com";
        };
        home-manager.enable = true;
    };
}