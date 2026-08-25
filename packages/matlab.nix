# Description
{ pkgs, username, ... }: {
  home-manager.users."${username}".programs.vscode.profiles.default.userSettings = {
    "MATLAB.installPath" = "/Applications/MATLAB_R2024b.app";
    "terminal.integrated.commandsToSkipShell" = ["matlab.interrupt"];
  };
}