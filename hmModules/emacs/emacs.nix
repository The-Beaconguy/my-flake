{pkgs, ...}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk; # pkgs.emacs-gtk better for x11
  };
  services.emacs = {
    enable = true;
    package = pkgs.emacs;
    defaultEditor = false;
  };
}
