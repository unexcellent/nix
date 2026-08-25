# Containerization
{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.podman
    pkgs.colima
  ];

  home-manager.sharedModules = [
    {
      home.shellAliases = {
        pd = "sudo podman";
      };
    }
  ];
}
