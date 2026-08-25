# Spaced Repetition Flash Cards
{ pkgs, username, ... }: {
  environment.systemPackages = [ pkgs.anki-bin ];
}