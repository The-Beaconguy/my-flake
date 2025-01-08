{ pkgs, ... }: {
  wayland.windowManager.river = {
    enable = true;
    package = pkgs.river;
    settings = {
      border-width = 2;
      declare-mode = [
        "locked"
        "normal"
        "passthrough"
      ];
      
      # keybindings
      "map normal Super Return" = "spawn ${pkgs.kitty}/bin/kitty";  
      "map normal Super Space" = "spawn ${pkgs.rofi}/bin/rofi -show drun";  
      
      # Window management
      "map normal Super+Shift Q" = "close";  # Close focused window
      "map normal Super+Shift E" = "exit";   # Exit River
      
      # Focus
      "map normal Super h" = "focus-view left";
      "map normal Super j" = "focus-view down";
      "map normal Super k" = "focus-view up";
      "map normal Super l" = "focus-view right";
      
      # Move windows
      "map normal Super+Shift h" = "move left";
      "map normal Super+Shift j" = "move down";
      "map normal Super+Shift k" = "move up";
      "map normal Super+Shift l" = "move right";
      
      # Default layout
      "default-layout" = "rivertile";
      
      # Startup commands
      "spawn" = "${pkgs.river}/bin/rivertile";  # Start the default tiling layout
    };
    
    xwayland.enable = true;
    systemd.enable = true;
    extraSessionVariables = {
      # Wayland-specific
      MOZ_ENABLE_WAYLAND = "1";
      
      # NVIDIA-specific variables
      WLR_NO_HARDWARE_CURSORS = "1";  # Fix for cursor issues
      LIBVA_DRIVER_NAME = "nvidia";
      XDG_SESSION_TYPE = "wayland";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      WLR_RENDERER = "vulkan";  # Using Vulkan renderer
      
      # Optional: if you experience flickering or tearing
      __GL_GSYNC_ALLOWED = "0";
      __GL_VRR_ALLOWED = "0";
    };
  };
}
