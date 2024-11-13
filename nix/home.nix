{ config, pkgs, inputs, ... }:

{
  imports = [
    ./configs/fish.nix
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
    librewolf
    cliphist
    
    # Rice
    stow
    rofi-wayland
    neofetch
    waybar
    # Swww
    swww

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
    alacritt
    oh-my-posh
    zellij
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

    # Passwords
    _1password
    _1password-gui
  ];

  programs.home-manager.enable = true;

  programs.firefox.enable = true;

  home.stateVersion = "24.05";
}
