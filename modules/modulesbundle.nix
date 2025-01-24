{
  lib,
  config,
  host,
  ...
}: {
  imports = [
    ./discord.nix
    ./games.nix
    ./editors/code-editors.nix
    ./amd-drivers.nix
    ./nvidia-drivers.nix
    #./nvf.nix
    ./nvidia-prime-drivers.nix
    ./intel-drivers.nix
    ./vm-guest-services.nix
    ./local-hardware-clock.nix
  ];
  # Conditional module toggling
  games.enable = host == "nixos";
  discord.enable = host == "nixos";
  code-editors.enable = lib.mkDefault true;
}
