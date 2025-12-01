{ zen-browser, ... }:

{
  imports = [ zen-browser.homeModules.beta ];

  programs.zen-browser = {
    enable = true;

    # profiles = {
    # Profile0 = { };
    # };

  };
}
