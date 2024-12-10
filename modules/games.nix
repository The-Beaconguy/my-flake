{pkgs, options, ...}:

{
 
     
  programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
  }; 

 environment.systemPackages = with pkgs; [
  lutris
  bottles
  


  ];
 # Extra Logitech Support
  hardware.logitech.wireless.enable = false;
  hardware.logitech.wireless.enableGraphical = false;
}
 

