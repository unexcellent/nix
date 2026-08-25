# Typst - a modern markup-based typesetting system
{
  pkgs,
  username,
  ...
}: {
  # Typst compiler, language server (tinymist) and formatter (typstyle)
  environment.systemPackages = [
    pkgs.typst
    pkgs.tinymist
    pkgs.typstyle
  ];

  home-manager.users."${username}".programs = {
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
