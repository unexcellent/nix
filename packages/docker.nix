# Containerization
{ pkgs, username, ... }: {
  environment.systemPackages = [
    pkgs.docker
    pkgs.colima
  ];

  home-manager.users."${username}".programs.vscode.profiles.default.extensions = (with pkgs.vscode-extensions; [
    ms-azuretools.vscode-docker
    ms-vscode-remote.remote-containers
  ]);
}