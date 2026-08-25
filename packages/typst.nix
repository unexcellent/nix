# Typst - a modern markup-based typesetting system
{
  pkgs,
  ...
}: {
  # Typst compiler, language server (tinymist) and formatter (typstyle)
  environment.systemPackages = [
    pkgs.typst
    pkgs.tinymist
    pkgs.typstyle
  ];

  home-manager.sharedModules = [
    {
      programs = {
        helix = {
          languages = {
            language = [
              {
                name = "typst";
                language-servers = ["tinymist"];
                formatter = {
                  command = "${pkgs.typstyle}/bin/typstyle";
                };
                auto-format = true;
              }
            ];
            language-server = {
              tinymist = {
                command = "${pkgs.tinymist}/bin/tinymist";
              };
            };
          };
        };
      };
    }
  ];
}
