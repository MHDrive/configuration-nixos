{ ... }:

{
    # Install firefox.
    # programs.firefox.enable = true;    

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };
    programs = {
        firefox.enable = true;
        bash = import ./bash.nix;
        starship = import ./starship.nix;
    };
}