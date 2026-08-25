# The firefox web browser
{...}: {
  home-manager.sharedModules = [
    {
      programs.firefox = {
        enable = true;
        profiles.default = {
          isDefault = true;
          settings = {
            # Disable password autofill
            "signon.autofillForms" = false;
            "signon.rememberSignons" = false;

            # Set the homepage and tell Firefox to load it on startup
            "browser.startup.homepage" = "https://github.com/users/unexcellent/projects/2";
            "browser.startup.page" = 1; # 1 = Home Page, 3 = Previous Session

            # Disable address and credit card autofill
            "extensions.formautofill.addresses.enabled" = false;
            "extensions.formautofill.creditCards.enabled" = false;
            "extensions.formautofill.heuristics.enabled" = false;
            "browser.translations.neverTranslateLanguages" = "en";
          };
        };
        policies.Extensions.Install = [
          "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi"
          "https://addons.mozilla.org/firefox/downloads/latest/cookie-autodelete/latest.xpi"
          "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi"
          "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi"
          "https://addons.mozilla.org/firefox/downloads/latest/new-tab-override/latest.xpi"
        ];
      };
    }
  ];
}
