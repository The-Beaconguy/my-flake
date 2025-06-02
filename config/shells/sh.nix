{
  username,
  host,
  ...
}: let
  Aliases = {
    sv = "sudo nvim";
    pfetch = "~/.config/pfetch/config.sh";
    fr = "nh os switch --hostname ${host} /home/${username}/zaneyos";
    fu = "nh os switch --hostname ${host} --update /home/${username}/zaneyos";
    zu = "sh <(curl -L https://gitlab.com/Zaney/zaneyos/-/raw/main/install-zaneyos.sh)";
    ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
    v = "nvim";
    vconfig = "v ~/zaneyos/hosts/nixos/config.nix";
    vhome = "v ~/zaneyos/hosts/nixos/home.nix";
    cat = "bat";
    lazyg = "cd ~/zaneyos && lazygit";
    pushgl = "cd ~/zaneyos && git push gitlab main";
    pushgh = "cd ~/zaneyos && git push github main";
    pushall = "cd ~/zaneyos && git push gitlab main && git push github main";
    gaa = "cd ~/zaneyos && git add *";
    ds = "doom sync";
    ls = "eza --icons";
    ll = "eza -lh --icons --grid --group-directories-first";
    la = "eza -lah --icons --grid --group-directories-first";
    ".." = "cd ..";
  };
in {
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      profileExtra = ''
        #if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        #  exec Hyprland
        #fi
      '';
      initExtra = ''
        if [ -f $HOME/.bashrc-personal ]; then
          source $HOME/.bashrc-personal
        fi
        export PATH="$HOME/.emacs.d/bin:$PATH"
        pfetch
      '';
      shellAliases = Aliases;
    };
    zsh = {
      enable = false;
      #dotDir = "home/${username}/.config/zsh";
      shellAliases = Aliases;
      enableCompletion = true;
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
      };
    };
  };
}
