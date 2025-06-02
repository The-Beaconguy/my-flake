{host, ...}: {
  programs.vesktop = {
    enable = true;
    settings = {
      appBadge = false;
      arRPC = true;
      enableSplashScreen = false;
      customTitleBar = false;
      disableMinSize = true;
      minimizeToTray = false;
      tray = true;
      splashTheming = true;
      staticTitle = true;
      hardwareAcceleration = false;
      discordBranch = "stable";
    };
    vencord = {
      useSystem = true;
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
          FakeNitro.enabled = true;
          ClearURLs.enabled = true;
          callTimer.enabled = true;
          ShowHiddenThings.enabled = true;
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
