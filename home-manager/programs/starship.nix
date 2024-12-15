{
  enable = true;
#   package = pkgs.starship;
  enableBashIntegration = true;
  settings = {
      "$schema" = "https://starship.rs/config-schema.json";
      scan_timeout = 10;
      add_newline = true;

      line_break.disabled = true;
      
      format = ''
          [┌──\[$username[@](bold blue)$hostname\]─>](bold green)$git_branch$git_metrics$git_commit$git_state$git_status
          [│](bold green)  $directory$all
          [└](bold green)$character
      '';
      character = {
          format = "$symbol ";
          success_symbol = "[❯](bold green)";
          error_symbol = "[✗](bold red)";
      };
      hostname = {
          ssh_only = false;
          format = "[$hostname]($style)";
          style = "bold blue";
          disabled = false;
      };
      username = {
          format = "[$user]($style)";
          style_root = "bold green";
          style_user = "bold blue";
          disabled = false;
          show_always = true;
      };
      nix_shell = {
          format = "via [$symbol-$name\\($state\\)]($style)";
          style = "blue";
          symbol = "nix";
      };
      git_metrics = {
          disabled = false;
      };
  };
}