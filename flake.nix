{
  description = "ZaneyOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    #pyprland.url = "github:hyprland-community/pyprland";
    stylix.url = "github:danth/stylix";
    nvf.url = "github:notashelf/nvf";
    tempus.url = "github:notashelf/tempus";
    go-pray.url = "github:0xzer0x/go-pray";
    noctalia = {
      url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nvf,
    nix-index-database,
    ...
  } @ inputs: let
    # system settings
    system = "x86_64-linux";
    host = "nixos";
    username = "mohammed";
    flakedir = "zaneyos";
    # program options
    programoptions = {
      browser = "firefox"; # Set Default Browser (google-chrome-stable for google-chrome)
      terminal = "kitty"; # Set Default System Terminal
      filemanger = "thunar"; # Set Default filemanger
      editor = "neovide"; # set default code editor
      discord-client = "vesktop"; # Set Default Discord-client
      keyboardLayout = "us,ara"; # Set Default keyboard Layout
      consolekeymap = "us"; # Set Default console keymap
      wm = "niri";
    };
  in {
    nixosConfigurations = {
      "${host}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system;
          inherit inputs;
          inherit programoptions;
          inherit flakedir;
          inherit username;
          inherit host;
        };

        modules = [
          ({pkgs, ...}: {
            nixpkgs.overlays = [];
            environment.systemPackages = [
              inputs.tempus.packages.${pkgs.stdenv.hostPlatform.system}.default
              inputs.go-pray.packages.${pkgs.stdenv.hostPlatform.system}.default
            ];
          })
          ./hosts/${host}/config.nix
          ./hmModules/noctalia/noctalia.nix
          inputs.stylix.nixosModules.stylix
          nix-index-database.nixosModules.default
          home-manager.nixosModules.home-manager
          nvf.nixosModules.default
          {
            home-manager.extraSpecialArgs = {
              inherit username;
              inherit flakedir;
              inherit programoptions;
              inherit inputs;
              inherit host;
            };
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.${username} = import ./hosts/${host}/home.nix;
            };
          }
        ];
      };
    };
  };
}
