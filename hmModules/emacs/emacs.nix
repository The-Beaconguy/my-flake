{pkgs, ...}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs30-pgtk; # pkgs.emacs-gtk better for x11
  };
  services.emacs = {
    enable = true;
    defaultEditor = false;
  };
}
