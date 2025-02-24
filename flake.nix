{
  description = "ZaneyOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    pyprland.url = "github:hyprland-community/pyprland";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    stylix.url = "github:danth/stylix";
    nvf.url = "github:notashelf/nvf";
    fine-cmdline = {
      url = "github:VonHeikemen/fine-cmdline.nvim";
      flake = false;
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    pyprland,
    nvf,
    ...
  } @ inputs: let
    # system settings
    system = "x86_64-linux";
    host = "nixos";
    username = "mohammed";
    # program options
    programoptions = {
      browser = "firefox"; # Set Default Browser (google-chrome-stable for google-chrome)
      terminal = "kitty"; # Set Default System Terminal
      filemanger = "thunar"; # Set Default filemanger
      editor = "neovide"; # set default code editor
      discord-client = "flatpak run dev.vencord.Vesktop"; # Set Default Discord-client
      keyboardLayout = "us,ara"; # Set Default keyboard Layout
      consolekeymap = "us"; # Set Default console keymap
    };
  in {
    nixosConfigurations = {
      "${host}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system;
          inherit inputs;
          inherit programoptions;
          inherit username;
          inherit host;
        };
        modules = [
          ({pkgs, ...}: {
            nixpkgs.overlays = [
              inputs.hyprpanel.overlay
            ];
            environment.systemPackages = [pyprland.packages."${system}".pyprland];
          })
          ./hosts/${host}/config.nix
          inputs.stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          nvf.nixosModules.default
          {
            home-manager.extraSpecialArgs = {
              inherit username;
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
