{pkgs, ... }:

let
  inherit (import ../hosts/nixos/variables.nix)    programoptions;
in
{

  environment.systemPackages = with pkgs; [
     ] ++ (if (programoptions.discord-client == "vesktop")
     then [pkgs.vesktop]
     else
      (if (programoptions.discord-client ==webcord)
        then [ pkgs.webcord-vencord] else []));


}


