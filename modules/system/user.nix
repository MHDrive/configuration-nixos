{ pkgs, ... }:

{
 # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mh = {
    isNormalUser = true;
    # shell = pkgs.bash;
    description = "MH";
    extraGroups = [ "networkmanager" "wheel" "nginx" ];
    packages = with pkgs; [
      postman
      obs-studio
    ];
  };
}