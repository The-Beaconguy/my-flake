{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    code-editors.enable =
      lib.mkEnableOption "enables code-editors";
  };
  config = lib.mkIf config.code-editors.enable {
    environment.systemPackages = with pkgs; [
      neovide
      vim
    ];

    #enable nvim
    programs.neovim.enable = true;
  };
}
