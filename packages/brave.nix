# A privacy focused browser
{ pkgs, ... }: {
  home-manager.sharedModules = [
    {
      programs.chromium = {
        enable = true;
        package = pkgs.brave;

        # Installed browser extensions. To get the id, open the desired extension on the chrome web
        # store and copy the id from the last section of the URL.
        extensions = [
          { id = "nngceckbapebfimnlniiiahkandclblb"; }  # bitwarden
          { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; }  # dark reader
          { id = "khncfooichmfjbepaaaebmommgaepoid"; }  # unhook - remove youtube recommendations
          { id = "hjfkenebldkfgibelglepinlabpjfbll"; }  # no youtube shorts
        ];
      };
    }
  ];
}