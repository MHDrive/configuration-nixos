{ ... }:

let
    version = "24.11";
in 
{
    imports = [
        ./boot.nix
        ./environment.nix
        ./locale.nix
        ./networking.nix
        ./time.nix
        ./user.nix
        ./nixpkgs.nix
        ./nix.nix
        ./programs/default.nix
        ./services.nix
        ./security.nix
        ./xdg.nix
        ./qt.nix
    ];
    system = {
        # This value determines the NixOS release from which the default
        # settings for stateful data, like file locations and database versions
        # on your system were taken. It‘s perfectly fine and recommended to leave
        # this value at the release version of the first install of this system.
        # Before changing this value read the documentation for this option
        # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
        stateVersion = "${version}"; # Did you read the comment?
    };
}