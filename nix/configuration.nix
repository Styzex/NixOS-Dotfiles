{ config, pkgs, inputs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    <home-manager/nixos>
    # Remove this line to avoid redundancy
    # inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Bratislava";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sk_SK.UTF-8";
    LC_IDENTIFICATION = "sk_SK.UTF-8";
    LC_MEASUREMENT = "sk_SK.UTF-8";
    LC_MONETARY = "sk_SK.UTF-8";
    LC_NAME = "sk_SK.UTF-8";
    LC_NUMERIC = "sk_SK.UTF-8";
    LC_PAPER = "sk_SK.UTF-8";
    LC_TELEPHONE = "sk_SK.UTF-8";
    LC_TIME = "sk_SK.UTF-8";
  };

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  hardware.opengl = {
    enable = true;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  users.users.viktoreeej = {
    isNormalUser = true;
    description = "Viktoreeej";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Set zsh as the default shell for all users
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

  services.flatpak.enable = true;
  programs.hyprland.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  systemd.services.bluetooth.enable = true;
  services.dbus.packages = [ pkgs.bluez ];

  environment.systemPackages = with pkgs; [
    libGL
    libGLU
    SDL2
    vulkan-tools
    vulkan-headers
    vulkan-loader
    vulkan-validation-layers
  ];

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  environment.pathsToLink = [
    "/share/home-manager"
  ];

  programs.gamemode.enable = true;
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;

  system.stateVersion = "24.05";
}
