# Server prompt: "user@<tailscale-ip> in <dir> ..." with the prompt character
# on its own line — same template as nix-pi. Merges on top of the base
# starship config from packages/starship.nix.
{ ... }: {
  home-manager.sharedModules = [
    {
      programs.starship.settings = {
        # Increase timeout (in milliseconds) to prevent the Tailscale command
        # from timing out
        command_timeout = 1000;

        format = "$username$hostname\${custom.ip_address}$directory$git_branch$git_status$python\n$character";

        username = {
          show_always = true;
          disabled = false;
          format = "[$user]($style)";
        };

        hostname = {
          disabled = true;
        };

        custom.ip_address = {
          command = "tailscale ip -4 2>/dev/null || ipconfig getifaddr en0";
          when = "true";
          shell = "bash";
          style = "bold blue";
          format = "[@$output]($style) ";
        };

        directory = {
          format = "in [$path]($style) ";
        };

        python = {
          symbol = "🐍 ";
          format = "via [\${symbol}\${version} (\\($virtualenv\\))]($style) ";
        };

        package = {
          disabled = true;
        };

        git_status = {
          format = "([\\[$all_status$ahead_behind\\]]($style) )";
        };
      };
    }
  ];
}
