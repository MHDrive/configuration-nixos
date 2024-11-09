{ ... }:

{
    programs = {
        fastfetch = import ./config/fastfetch.nix;
        bash = {
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
            # bashExtra = "";
            shellAliases = {
                c = "clear";
                snrs = "sudo nixos-rebuild switch";
            };
        };
        git = {
            enable = true;
            userName = "Muhammad Hamdi";
            userEmail = "hamdj360@gmail.com";
        };
    };
}