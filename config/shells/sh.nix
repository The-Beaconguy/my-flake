{
  username,
  flakedir,
  host,
  ...
}: let
  Aliases = {
    sv = "sudo nvim";
    pfetch = "~/.config/pfetch/config.sh";
    fr = "nh os switch --hostname ${host} /home/${username}/${flakedir}";
    fu = "nh os switch --hostname ${host} --update /home/${username}/${flakedir}";
    zu = "sh <(curl -L https://gitlab.com/Zaney/zaneyos/-/raw/main/install-zaneyos.sh)";
    ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
    v = "nvim";
    vconfig = "v ~/${flakedir}/hosts/nixos/config.nix";
    vhome = "v ~/${flakedir}/hosts/nixos/home.nix";
    vzc = "v ~/${flakedir}/config/";
    vm = "v ~/${flakedir}/modules/";
    cat = "bat";
    lazyg = "cd ~/${flakedir} && lazygit";
    pushgl = "cd ~/${flakedir} && git push gitlab main";
    pushgh = "cd ~/${flakedir} && git push github main";
    pushall = "cd ~/${flakedir} && git push gitlab main && git push github main";
    gaa = "cd ~/${flakedir} && git add *";
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
      bashrcExtra = ''
           ufetch() {
         birth_install=$(stat -c %W /)
         current=$(date +%s)
         delta=$((current - birth_install))
         delta_days=$((delta / 86400))

        command ufetch | awk -v days="$delta_days" '
          /KERNEL:/ {
            print
            printf "                    \033[1;35mINSTALL AGE:\033[0m %s days\n", days
            next
          }
          { print }
         '
        }
      '';
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
