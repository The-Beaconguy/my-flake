# some code is stolen from (Ladas552)
# https://github.com/Ladas552/Nix-Is-Unbreakable/blob/master/homeModules/vesktop/default.nix
{
  programs.vesktop = {
    enable = true;
    settings = {
      appBadge = false;
      arRPC = true;
      enableSplashScreen = false;
      customTitleBar = false;
      disableMinSize = true;
      minimizeToTray = true;
      tray = true;
      splashTheming = true;
      staticTitle = true;
      hardwareAcceleration = false;
      discordBranch = "stable";
    };
    vencord = {
      # I get a white screen, this fixes it, but it has some downsides or something, i may reenable it after sometime
      useSystem = false;
      settings = {
        notifyAboutUpdates = true;
        autoUpdate = true;
        frameless = false;
        transparent = false;
        useQuickCss = true;
        winCtrlQ = false;
        plugins = {
          MessageLogger = {
            enabled = true;
            ignoreSelf = false;
          };
          FakeNitro.enabled = false;
          ClearURLs.enabled = true;
          callTimer.enabled = true;
          ShowHiddenThings.enabled = true;
          ShowHiddenChannels.enabled = true;
          SilentMessageToggle.enabled = true;
          FriendsSince.enabled = true;
          WhoReacted.enabled = true;
        };
        themeLinks = [
          "https://raw.githubusercontent.com/refact0r/system24/refs/heads/main/theme/flavors/system24-rose-pine-moon.theme.css"
        ];
      };
    };
  };
}
