# stole this from Tyler Kelley, i was too lazy to find which plugins work best for my setup.
# https://gitlab.com/Zaney/zaneyos/-/blob/main/modules/home/obs-studio.nix
{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    #enableVirtualCamera = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-pipewire-audio-capture
      obs-vkcapture
      obs-source-clone
      obs-move-transition
      obs-composite-blur
      obs-backgroundremoval
    ];
  };
}
