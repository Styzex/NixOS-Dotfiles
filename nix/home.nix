{ config, pkgs, inputs, ... }:

{
  imports = [
    ./configs/zsh.nix
    ./configs/rust.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.username = "viktoreeej";
  home.homeDirectory = "/home/viktoreeej";

  home.packages = with pkgs; [
    # System
    wget
    nerdfonts
    bluez
    neovim
    libdbusmenu-gtk3
    btop
    tree
    yazi
    cliphist
    pavucontrol
    
    # Rice
    stow
    rofi-wayland
    neofetch
    waybar
    nwg-bar
    swww
    dunst

    # Dependencies
    gtksourceview
    webkitgtk
    accountsservice

    # Apps
    discord
    vesktop
    qalculate-gtk
    grim
    slurp
    
    # Terminal
    alacritty
    oh-my-posh
    tmux
    fzf
    zoxide
    zinit
    eza

    # Useless clis
    cmatrix
    peaclock

    # Windows Disks
    ntfs3g

    # Coding
    vscode
    git
    gh
    nodejs
    bun
    go

    # Gaming
    mangohud
    bottles
    protonup
    heroic
    steamcontroller
    prismlauncher

    # Passwords
    _1password
    _1password-gui
  ];

  programs.home-manager.enable = true;

  programs.firefox.enable = true;

  home.stateVersion = "24.05";
}
