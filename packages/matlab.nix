# Description
{ pkgs, ... }: {
  home-manager.sharedModules = [
    {
      programs.vscode.profiles.default.userSettings = {
        "MATLAB.installPath" = "/Applications/MATLAB_R2024b.app";
        "terminal.integrated.commandsToSkipShell" = ["matlab.interrupt"];
      };
    }
  ];
}