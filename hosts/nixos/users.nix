{
  pkgs,
  username,
  ...
}:

let
  inherit (import ./variables.nix) gitUsername;
in
{
  users.users = {
    "${username}" = {
      homeMode = "755";
      isNormalUser = true;
      description = "${gitUsername}";
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "scanner"
        "lp"
      ];
      shell = pkgs.bash;
      ignoreShellProgramCheck = true;
      packages = with pkgs; [
      ];
      #programs.sudo = { #No need,use sudo -E "PROGRAM NAME" this will make u open it with xwayland
      #enable = true; 
      #envVars = {
      #WAYLAND_DISPLAY = "wayland-0";
      #XDG_RUNTIME_DIR = "/run/user/0";
      #};
      #};
    };


  #users.users.mohammedroot = {
  #name = "mohammedroot";
  #group = "users";
  #homeMode = "755";
  #createHome = true;
  #shell = pkgs.bash;  # or any other shell you prefer
 # }; 
};
}
