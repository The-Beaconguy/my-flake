{pkgs, ...}:

let
  inherit (import ../../hosts/nixos/variables.nix) programoptions;
  in
  {
  environment.systemPackages = with pkgs; [
  vscodium
  neovide
  vim
  ];

  #enable nvim
  programs.neovim.enable = true;


}
