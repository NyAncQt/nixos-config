{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # ---------------- Boot ----------------
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia_drm"
  ];

  # ---------------- Nix ----------------
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";

  # ---------------- Networking ----------------
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Istanbul";
  i18n.defaultLocale = "en_US.UTF-8";

  # ---------------- Hyprland ----------------
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    NIXOS_OZONE_WL = "1";
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  # ---------------- Audio ----------------
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  security.rtkit.enable = true;

  # ---------------- Graphics (NVIDIA) ----------------
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # ---------------- Gaming ----------------
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.gamemode.enable = true;

  # ---------------- Shell ----------------
  programs.fish.enable = true;

  # ---------------- Flatpak ----------------
  services.flatpak.enable = true;

  # ---------------- XDG Portals ----------------
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  # ---------------- USER ----------------
  users.users.cat = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
    shell = pkgs.fish;
  };

  # ---------------- SYSTEM PACKAGES ----------------
  environment.systemPackages = with pkgs; [
    # core
    git wget curl jq neovim fzf
    eza
    # desktop
    firefox foot chromium networkmanagerapplet

    # tools
    fastfetch btop cava pavucontrol wl-clipboard grim slurp brightnessctl
   kitty

    # gaming
    lutris heroic wineWowPackages.stable winetricks bottles mangohud
    yazi

    starship

    # hyprland utils
    hyprpicker cliphist
    gcc
  gnumake
  pkg-config
  curl
  cjson
  openssl

    # qt
    qt6.qtbase qt6.qtdeclarative qt6.qtshadertools

    # visuals
    nerd-fonts.jetbrains-mono
    papirus-icon-theme adwaita-icon-theme
    bibata-cursors

    # file managers / apps
    kdePackages.dolphin kdePackages.kate kdePackages.konsole kdePackages.ark

    # IMPORTANT: spicetify CLI
    spicetify-cli
    spotify
    zed-editor
    signal-desktop
    github-desktop
    pavucontrol
    nemo
    gh
  ];

  # ---------------- FONTS ----------------
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # ---------------- SERVICES ----------------
  services.dbus.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.upower.enable = true;
}
