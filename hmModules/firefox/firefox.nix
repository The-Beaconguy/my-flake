{inputs, ...}: {
  programs.firefox = {
    enable = true;
    profiles."o9zdc1mp.default" = {
      isDefault = true;
      bookmarks = [
        {
          name = "Dar Al Harf";
          url = "https://daralharf.com/";
        }
        {
          toolbar = true;
        }
        {
          name = "YouTube";
          url = "https://youtube.com";
        }
        {
          name = "National Gallery of Art";
          url = "https://www.nga.gov/";
        }
        {
          name = "Artvee Landscapes";
          url = "https://artvee.com/c/landscape/";
        }
        {
          name = "Wallhaven";
          url = "https://wallhaven.cc/";
        }
        {
          name = "Classera";
          url = "https://me.classera.com/student/users/login#networkfirst";
        }
        {
          name = "Al Naffaee";
          url = "https://alnaffaee.com/";
        }
        {
          name = "MetaDefender";
          url = "https://metadefender.opswat.com/";
        }
        {
          name = "iLovePDF";
          url = "https://www.ilovepdf.com/";
        }
        {
          name = "Tutanota Mail";
          url = "https://mail.tutanota.com/login?requestedPath=%2Fmail%2FNaa15ze--c-9";
        }
        {
          name = "NixOS";
          url = "https://nixos.org";
        }
        {
          name = "My NixOS";
          url = "https://mynixos.com";
        }
        {
          name = "NixOS and Flakes Guide";
          url = "https://nixos-and-flakes.thiscute.world/introduction/";
        }
        {
          name = "Zero to Nix";
          url = "https://zero-to-nix.com/";
        }
        {
          name = "Vim Cheatsheet";
          url = "https://vim.rtorr.com/lang/en_us";
        }
      ];

      userChrome = ''
        @media (prefers-color-scheme: dark) {
          :root {
            --accent-color: #1c1b22;
          }
        }

        @media (prefers-color-scheme: light) {
          :root {
            --accent-color: #FAFAFC;
          }
        }

        /*====== Aesthetics ======*/
        #navigator-toolbox {
          border-bottom: none !important;
        }

        #titlebar {
          background: var(--accent-color) !important;
        }

        /* Sets the toolbar color */
        toolbar#nav-bar {
          background: var(--accent-color) !important;
          box-shadow: none !important;
        }

        /* Sets the URL bar color */
        #urlbar {
          background: var(--accent-color) !important;
        }

        #urlbar-background {
          background: var(--accent-color) !important;
          border: none !important;
        }

        #urlbar-input-container {
          border: none !important;
        }

        /*====== UI Settings ======*/
        :root {
          --navbarWidth: 500px; /* Set width of navbar */
        }

        /* If the window is wider than 1000px, use flex layout */
        @media (min-width: 1000px) {
          #navigator-toolbox {
            display: flex;
            flex-direction: row-reverse;
            flex-wrap: wrap;
          }

          /*  Url bar  */
          #nav-bar {
            order: 1;
            width: var(--navbarWidth);
          }

          /* Tab bar */
          #titlebar {
            order: 2;
            width: calc(100vw - var(--navbarWidth) - 1px);
          }

          /* get rid of blank space */
          #toolbar-menubar {
            display: none;
          }

          /* Bookmarks bar */
          #PersonalToolbar {
            order: 3;
            width: 100%;
          }

          /* Fix urlbar sometimes being misaligned */
          :root[uidensity="compact"] #urlbar {
            --urlbar-toolbar-height: 39.60px !important;
          }

          :root[uidensity="touch"] #urlbar {
            --urlbar-toolbar-height: 49.00px !important;
          }
        }
      '';

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        ublock-origin
        sponsorblock
        darkreader
        vimium
        tridactyl
        youtube-shorts-block
      ];
    };
  };
  home.file.".mozilla/firefox/o9zdc1mp.default/user.js".text = ''
        //
    /* You may copy+paste this file and use it as it is.
     *
     * If you make changes to your about:config while the program is running, the
     * changes will be overwritten by the user.js when the application restarts.
     *
     * To make lasting changes to preferences, you will have to edit the user.js.
     */

    /****************************************************************************
     * Betterfox                                                                *
     * "Ad meliora"                                                             *
     * version: 138                                                             *
     * url: https://github.com/yokoffing/Betterfox                              *
    ****************************************************************************/

    /****************************************************************************
     * SECTION: FASTFOX                                                         *
    ****************************************************************************/
    /** GENERAL ***/
    user_pref("content.notify.interval", 100000);

    /** GFX ***/
    user_pref("gfx.canvas.accelerated.cache-size", 512);
    user_pref("gfx.content.skia-font-cache-size", 20);

    /** DISK CACHE ***/
    user_pref("browser.cache.disk.enable", false);

    /** MEMORY CACHE ***/
    user_pref("browser.sessionhistory.max_total_viewers", 4);

    /** MEDIA CACHE ***/
    user_pref("media.memory_cache_max_size", 65536);
    user_pref("media.cache_readahead_limit", 7200);
    user_pref("media.cache_resume_threshold", 3600);

    /** IMAGE CACHE ***/
    user_pref("image.mem.decode_bytes_at_a_time", 32768);

    /** NETWORK ***/
    user_pref("network.http.max-connections", 1800);
    user_pref("network.http.max-persistent-connections-per-server", 10);
    user_pref("network.http.max-urgent-start-excessive-connections-per-host", 5);
    user_pref("network.http.pacing.requests.enabled", false);
    user_pref("network.dnsCacheExpiration", 3600);
    user_pref("network.ssl_tokens_cache_capacity", 10240);

    /** SPECULATIVE LOADING ***/
    user_pref("network.http.speculative-parallel-limit", 0);
    user_pref("network.dns.disablePrefetch", true);
    user_pref("network.dns.disablePrefetchFromHTTPS", true);
    user_pref("browser.urlbar.speculativeConnect.enabled", false);
    user_pref("browser.places.speculativeConnect.enabled", false);
    user_pref("network.prefetch-next", false);
    user_pref("network.predictor.enabled", false);
    user_pref("network.predictor.enable-prefetch", false);

    /** EXPERIMENTAL ***/
    user_pref("layout.css.grid-template-masonry-value.enabled", true);

    /****************************************************************************
     * SECTION: SECUREFOX                                                       *
    ****************************************************************************/
    /** TRACKING PROTECTION ***/
    user_pref("browser.contentblocking.category", "strict");
    user_pref("browser.download.start_downloads_in_tmp_dir", true);
    user_pref("browser.helperApps.deleteTempFileOnExit", true);
    user_pref("browser.uitour.enabled", false);
    user_pref("privacy.globalprivacycontrol.enabled", true);

    /** OCSP & CERTS / HPKP ***/
    user_pref("security.OCSP.enabled", 0);
    user_pref("security.pki.crlite_mode", 2);

    /** SSL / TLS ***/
    user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
    user_pref("browser.xul.error_pages.expert_bad_cert", true);
    user_pref("security.tls.enable_0rtt_data", false);

    /** DISK AVOIDANCE ***/
    user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
    user_pref("browser.sessionstore.interval", 60000);

    /** SHUTDOWN & SANITIZING ***/
    user_pref("browser.privatebrowsing.resetPBM.enabled", true);
    user_pref("privacy.history.custom", true);

    /** SEARCH / URL BAR ***/
    user_pref("browser.urlbar.trimHttps", true);
    user_pref("browser.urlbar.untrimOnUserInteraction.featureGate", true);
    user_pref("browser.search.separatePrivateDefault.ui.enabled", true);
    user_pref("browser.urlbar.update2.engineAliasRefresh", true);
    user_pref("browser.search.suggest.enabled", false);
    user_pref("browser.urlbar.quicksuggest.enabled", false);
    user_pref("browser.urlbar.groupLabels.enabled", false);
    user_pref("browser.formfill.enable", false);
    user_pref("network.IDN_show_punycode", true);

    /** PASSWORDS ***/
    user_pref("signon.formlessCapture.enabled", false);
    user_pref("signon.privateBrowsingCapture.enabled", false);
    user_pref("network.auth.subresource-http-auth-allow", 1);
    user_pref("editor.truncate_user_pastes", false);

    /** MIXED CONTENT + CROSS-SITE ***/
    user_pref("security.mixed_content.block_display_content", true);
    user_pref("pdfjs.enableScripting", false);

    /** EXTENSIONS ***/
    user_pref("extensions.enabledScopes", 5);

    /** HEADERS / REFERERS ***/
    user_pref("network.http.referer.XOriginTrimmingPolicy", 2);

    /** CONTAINERS ***/
    user_pref("privacy.userContext.ui.enabled", true);

    /** SAFE BROWSING ***/
    user_pref("browser.safebrowsing.downloads.remote.enabled", false);

    /** MOZILLA ***/
    user_pref("permissions.default.desktop-notification", 2);
    user_pref("permissions.default.geo", 2);
    user_pref("geo.provider.network.url", "https://beacondb.net/v1/geolocate");
    user_pref("browser.search.update", false);
    user_pref("permissions.manager.defaultsUrl", "");
    user_pref("extensions.getAddons.cache.enabled", false);

    /** TELEMETRY ***/
    user_pref("datareporting.policy.dataSubmissionEnabled", false);
    user_pref("datareporting.healthreport.uploadEnabled", false);
    user_pref("toolkit.telemetry.unified", false);
    user_pref("toolkit.telemetry.enabled", false);
    user_pref("toolkit.telemetry.server", "data:,");
    user_pref("toolkit.telemetry.archive.enabled", false);
    user_pref("toolkit.telemetry.newProfilePing.enabled", false);
    user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
    user_pref("toolkit.telemetry.updatePing.enabled", false);
    user_pref("toolkit.telemetry.bhrPing.enabled", false);
    user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
    user_pref("toolkit.telemetry.coverage.opt-out", true);
    user_pref("toolkit.coverage.opt-out", true);
    user_pref("toolkit.coverage.endpoint.base", "");
    user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
    user_pref("browser.newtabpage.activity-stream.telemetry", false);
    user_pref("datareporting.usage.uploadEnabled", false);

    /** EXPERIMENTS ***/
    user_pref("app.shield.optoutstudies.enabled", false);
    user_pref("app.normandy.enabled", false);
    user_pref("app.normandy.api_url", "");

    /** CRASH REPORTS ***/
    user_pref("breakpad.reportURL", "");
    user_pref("browser.tabs.crashReporting.sendReport", false);

    /****************************************************************************
     * SECTION: PESKYFOX                                                        *
    ****************************************************************************/
    /** MOZILLA UI ***/
    user_pref("browser.privatebrowsing.vpnpromourl", "");
    user_pref("extensions.getAddons.showPane", false);
    user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
    user_pref("browser.discovery.enabled", false);
    user_pref("browser.shell.checkDefaultBrowser", false);
    user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
    user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
    user_pref("browser.preferences.moreFromMozilla", false);
    user_pref("browser.aboutConfig.showWarning", false);
    user_pref("browser.aboutwelcome.enabled", false);
    user_pref("browser.profiles.enabled", true);

    /** THEME ADJUSTMENTS ***/
    user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
    user_pref("browser.compactmode.show", true);
    user_pref("browser.privateWindowSeparation.enabled", false); // WINDOWS

    /** FULLSCREEN NOTICE ***/
    user_pref("full-screen-api.transition-duration.enter", "0 0");
    user_pref("full-screen-api.transition-duration.leave", "0 0");
    user_pref("full-screen-api.warning.timeout", 0);

    /** URL BAR ***/
    user_pref("browser.urlbar.unitConversion.enabled", true);
    user_pref("browser.urlbar.trending.featureGate", false);
    user_pref("dom.text_fragments.create_text_fragment.enabled", true);

    /** NEW TAB PAGE ***/
    user_pref("browser.newtabpage.activity-stream.default.sites", "");
    user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
    user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
    user_pref("browser.newtabpage.activity-stream.showSponsored", false);

    /** POCKET ***/
    user_pref("extensions.pocket.enabled", false);

    /** DOWNLOADS ***/
    user_pref("browser.download.manager.addToRecentDocs", false);

    /** PDF ***/
    user_pref("browser.download.open_pdf_attachments_inline", true);

    /** TAB BEHAVIOR ***/
    user_pref("browser.bookmarks.openInTabClosesMenu", false);
    user_pref("browser.menu.showViewImageInfo", true);
    user_pref("findbar.highlightAll", true);
    user_pref("layout.word_select.eat_space_to_next_word", false);

    /****************************************************************************
     * START: MY OVERRIDES                                                      *
    ****************************************************************************/
    // visit https://github.com/yokoffing/Betterfox/wiki/Common-Overrides
    // visit https://github.com/yokoffing/Betterfox/wiki/Optional-Hardening
    // Enter your personal overrides below this line:



    /****************************************************************************
     * SECTION: SMOOTHFOX                                                       *
    ****************************************************************************/
    // visit https://github.com/yokoffing/Betterfox/blob/main/Smoothfox.js
    // Enter your scrolling overrides below this line:



    /****************************************************************************
     * END: BETTERFOX                                                           *
    ****************************************************************************/
  '';
}
