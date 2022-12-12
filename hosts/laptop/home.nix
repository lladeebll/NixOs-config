{ config, pkgs, ... }:

{
    imports = [
        ../../modules/dev.nix
    ];
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    home.username = "adeeb";
    home.homeDirectory = "/home/adeeb";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "22.11";

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    programs.zsh = {
        enable = true;
        oh-my-zsh = {
            enable = true;
        };
    };

    home.file.".zshrc" = {
        source = ../../modules/dot-zshrc;
    };

    home.packages = with pkgs; [
        alacritty
        alttab
        bat
        betterlockscreen
        bluez
        brave
        catppuccin-gtk
        cinnamon.nemo
        cmake
        conky
        dunst
        dracula-theme
        emacs
        fd
        feh
        flameshot
        exa
        gcc
        gvfs
        htop
        libreoffice
        lm_sensors
        lxappearance
        mpv
        neofetch
        notify
        picom-jonaburg
        polybar
        procs
        ranger
        ripgrep
        rofi
        snapper
        snapper-gui
        starship
        stow
        taffybar
        tdesktop
        trash-cli
        victor-mono
        wmctrl
        yad
        zathura
        zoxide
    ];

}