{inputs, config, nix-doom-emacs, doom-emacs, ...}:
{
  imports = [
    nix-doom-emacs.hmModule
  ];
  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./doom;
    };
  services.emacs = {
    enable = true;
  };
  home.sessionPath = [ "${config.xdg.configHome}/emacs/bin" ];
}
