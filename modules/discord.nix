# Deprecated. see /config/vesktop.nix
{
  pkgs,
  lib,
  config,
  programoptions,
  ...
}: {
  options = {
    discord.enable =
      lib.mkEnableOption "enables discord";
  };

  config = lib.mkIf config.discord.enable {
    environment.systemPackages = with pkgs;
      [
      ]
      ++ (
        if (programoptions.discord-client == "vesktop")
        then [pkgs.vesktop]
        else
          (
            if (programoptions.discord-client == webcord)
            then [pkgs.webcord-vencord]
            else []
          )
      );
  };
}
