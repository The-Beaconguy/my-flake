{ pkgs, lib, config, ...}: {


  imports = [
  ./discord.nix
  ./games.nix
  ./editors/code-editors.nix
  ./amd-drivers.nix
  ./nvidia-drivers.nix
  ./nvidia-prime-drivers.nix
  ./intel-drivers.nix
  ./vm-guest-services.nix
  ./local-hardware-clock.nix
 ];
}

