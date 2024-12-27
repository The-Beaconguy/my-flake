{inputs, config, pkgs, ...}:
{  
  programs.emacs = {
  enable = true;
  package = pkgs.emacs29-pgtk; # pkgs.emacs-gtk better for x11
};
  services.emacs = {
    enable = true;
    defaultEditor = true;
  };
}
