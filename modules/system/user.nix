{ pkgs, ... }:

{
 # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mh = {
    isNormalUser = true;
    description = "MH";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };
}