# Containerization
# On macOS podman is a remote client to a Linux VM; create it once per user
# with `podman machine init`. Never use sudo with podman here - "rootful"
# containers are a VM setting (`podman machine set --rootful`), and root has
# no connection to the user's VM.
{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.podman
  ];

  home-manager.sharedModules = [
    {
      home.shellAliases = {
        pm = "podman";
      };
    }
  ];
}
