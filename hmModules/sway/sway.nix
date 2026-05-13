{...}: {
  wayland.windowManager.sway = {
    enable = false;
    xwayland = true;
    wrapperFeatures.gtk = true;
    extraSessionCommands = ''
      export WLR_NO_HARDWARE_CURSORS=1
    '';
    extraOptions = ["--unsupported-gpu"];
    config = {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "kitty";
      startup = [
        # Launch Firefox on start
        {command = "firefox";}
        {command = "waybar";}
      ];
    };
  };
}
