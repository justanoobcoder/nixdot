{pkgs, ...}: {
  imports = [
    ./terminal.nix
    ./fonts.nix
    ./wayland.nix
    ./theme.nix
    ./wofi.nix
    ./screenshot.nix
    ./cliphist.nix
  ];
  programs = {
    mpv.enable = true;
  };

  home.packages = with pkgs; [
    font-awesome
    brave
    xfce.thunar
    imv
    spotify
  ];
}
