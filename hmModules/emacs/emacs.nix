{
  inputs,
  config,
  pkgs,
  ...
}: {
  programs.emacs = {
    enable = false;
    package = pkgs.emacs29-pgtk; # pkgs.emacs-gtk better for x11
  };
  services.emacs = {
    enable = false;
    defaultEditor = false;
  };
}
