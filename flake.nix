{
  description = "ZaneyOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; 
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
     emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
      hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    stylix.url = "github:danth/stylix";
    fine-cmdline = {
      url = "github:VonHeikemen/fine-cmdline.nvim";
      flake = false;
    };
      firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, emacs-overlay, ... }@inputs:
    let   # system settings
      system = "x86_64-linux";
      host = "nixos";
      username = "mohammed";
       # program options
      programoptions = {
      browser = "firefox"; # Set Default Browser (google-chrome-stable for google-chrome)
      terminal = "kitty"; # Set Default System Terminal
      filemanger = "thunar"; # Set Default filemanger
      editor-shortcut = "kitty -e emacsclient -c -a 'neovide'"; # Open emacsclient code editor
      editor = "neovide"; # Set Default code editor
      discord-client = "vesktop"; # Set Default Discord-client
      keyboardLayout = "us,ara"; # Set Default keyboard Layout
      consolekeymap = "us"; # Set Default console keymap
};
    in
      
    {
      nixosConfigurations = {
        "${host}" = nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {
            inherit system;
            inherit inputs;
            inherit programoptions;
            inherit username;
            inherit host;
          };
          modules = [
            ({ pkgs, ... }: {
              nixpkgs.overlays = [ inputs.emacs-overlay.overlay ];
            })
            ./hosts/${host}/config.nix
            inputs.stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = {
                inherit username;
                inherit programoptions;
                inherit inputs;
                inherit host;
              };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.${username} = import ./hosts/${host}/home.nix;
            }
          ];
        };
      };
    };
}


