{
  enable = true;
  enableCompletion = true;
  enableVteIntegration = true;
  historyFile = "$HOME/.bash_history";
  historyFileSize = 1000000;
  historySize = 10000;
  historyControl = [ "ignoredups" "ignorespace" ];
  historyIgnore = [
      "ls"
      "cd"
      "exit"
      "clear"
      "mv"
      "cp"
      "cat"
      "bat"
      "code"
      "nano"
      "vim"
      "gedit"
  ];
  shellOptions = [
      "autocd" # mengizinkan anda berpindah direktori hanya dengan mengetikkan nama direktori saja.
      "cdspell" # memperbaiki kesalahan ketik
      "extglob" # mengaktifkan ekspansi pola lanjutan contoh ls *.txt
      "globstar" # mengaktifkan pencarian rekursif dengan pola ** contohnya ls **/*.txt
      "nocaseglob" # membuat pencaharian file tidak peka terhadap huruf besar dan kecil
  ];
  bashrcExtra = ''
      # Banner
      function show_banner() {
          local color_red="\e[31m"
          local color_green="\e[32m"
          local color_yellow="\e[33m"
          local color_blue="\e[34m"
          local color_magenta="\e[35m"
          local color_cyan="\e[36m"
          local color_reset="\e[0m"
          
          echo -e "\n$color_magenta
          ███╗   ██╗██╗██╗  ██╗ ██████╗ ███████╗
          ████╗  ██║██║╚██╗██╔╝██╔═══██╗██╔════╝
          ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║███████╗
          ██║╚██╗██║██║ ██╔██╗ ██║   ██║╚════██║
          ██║ ╚████║██║██╔╝ ██╗╚██████╔╝███████║
          ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝
          $color_reset"
          
          echo -e "$color_cyan╭─────────── System Information ───────────╮$color_reset"
          echo -e "$color_red  → Kernel: $(uname -sr)" $color_reset
          echo -e "$color_blue  → Uptime: $(awk '{print int($1/86400)"d " int(($1%86400)/3600)"h " int(($1%3600)/60)"m"}' /proc/uptime)" $color_reset
          echo -e "$color_magenta  → Shell: $(basename $SHELL)" $color_reset
          
          echo -e "$color_cyan╰──────────────────────────────────────────╯$color_reset\n"
      }
      
      # Call Banner
      show_banner
      
      # For ls
      export LS_COLORS="di=1;34:ln=1;36:so=1;31:pi=1;33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
      
      # for man pages
      export LESS_TERMCAP_mb=$'\e[1;32m'
      export LESS_TERMCAP_md=$'\e[1;32m'
      export LESS_TERMCAP_me=$'\e[0m'
      export LESS_TERMCAP_se=$'\e[0m'
      export LESS_TERMCAP_so=$'\e[01;33m'
      export LESS_TERMCAP_ue=$'\e[0m'
      export LESS_TERMCAP_us=$'\e[1;4;31m'
      '';
  shellAliases = {
      c = "clear";
      snrs = "sudo nixos-rebuild switch --show-trace --verbose";
      snrdb = "sudo nixos-rebuild dry-build --show-trace --verbose";
      snrt = "sudo nixos-rebuild test --show-trace --verbose";
      nrr = "nixos-rebuild repl --show-trace --verbose";
      nr = "nix repl --show-trace --verbose";
      prime-nvidia = "__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia";
      ff = "fastfetch";
      pa = "php artisan";
  };
}