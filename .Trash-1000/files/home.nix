{ config, pkgs, ... }:

{
  # To do please change the username & home directory to your own
  home.username = "mh";
  home.homeDirectory = "/home/mh";

  home.packages = with pkgs; [

    # archives
    zip
    xz
    unzip
    p7zip

    # utilis
    bat
  ];

  programs.git = {
    enable = true;
    userName = "Muhammad Hamdi";
    userEmail = "hamdj360@gmail.com";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    #  bashExtra = "";
    shellAliases = {
      
    };
  };
  
  home.stateVersion = "24.05";
}
