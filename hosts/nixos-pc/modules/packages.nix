{pkgs, ...}: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    gnumake
    cmake
    wget
    power-profiles-daemon
    cloudflare-warp
    zip
    unzip
    ntfs3g
    ripgrep
    bat
    bc
    libnotify
    glib
    python3
    python311Packages.pip
    lua
    gcc
  ];

  programs = {
    fish.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
