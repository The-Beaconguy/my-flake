{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    games.enable =
      lib.mkEnableOption "enables games";
  };

  config = lib.mkIf config.games.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    environment.systemPackages = with pkgs; [
      # Breaks flake update
      # lutris
      # bottles
    ];
    # Extra Logitech Support
    hardware.logitech.wireless = {
      enable = false;
      enableGraphical = false;
    };
  };
}
