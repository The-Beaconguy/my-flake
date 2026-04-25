{
  pkgs,
  username,
  ...
}: {
  users.users = {
    "${username}" = {
      homeMode = "755";
      isNormalUser = true;
      description = "mohammedgit";
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "input" # For evtest
        "scanner"
        "lp"
      ];
      shell = pkgs.bash;
      ignoreShellProgramCheck = true;
      #programs.sudo = { #No need,use sudo -E "PROGRAM NAME" this will make u open it with xwayland
      #enable = true;
      #};
    };
  };
}
