{ ... }:
let
    lock-true = {
        Value = true;
        Status = "locked";
    };
    lock-false = {
        Value = false;
        Status = "locked";
    };
in {
    programs.firefox = {
        enable = true;
        languagePacks = [ "en-US" ];

        policies = {
            DisableFirefoxStudies = true;
            EnableTrackingProtection = {
                Value = true;
                Locked = true;
                Crytomining = true;
                Fingerprinting = true;
            };
            DisablePocket = true;
            DisableFirefoxAccounts = true;
            DisableAccounts = true;
            DisableFirefoxScreenshots = true;
            OverrideFirstRunPage = "";
            OverridePostUpdatePage = "";
            DontCheckDefaultBrowser = "";
            DisplayBookmarksToolbar = "always";
            DisplayMenuBar = "default-off";
            SearchBar = "unified";
        };

        ExtensionSettings = {
            "*".installation_mode = "blocked";

            # uBlock Origin
            "uBlock0@raymondhill.net" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
                installation_mode = "force_installed";
            };
            # Privacy Badger:
            "jid1-MnnxcxisBPnSXQ@jetpack" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
                installation_mode = "force_installed";
            };
            # Video Speed Controller
            "{7be2ba16-0f1e-4d93-9ebc-5164397477a9}" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/videospeed/latest.xpi";
                installation_mode = "force_installed";
            };
        };

        Preferences = {
            "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
            "extensions.pocket.enabled" = lock-false;
            "extensions.screenshots.disabled" = lock-true;
            "browser.topsites.contile.enabled" = lock-false;
            "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
            "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
            "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
            "browser.newtabpage.activity-stream.showSponsored" = lock-false;
            "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
        };
    };
}
