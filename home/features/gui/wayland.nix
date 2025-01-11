{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  name = "wayland";
  cfg = config.features.gui.${name};
in {
  options.features.gui.${name}.enable = mkEnableOption "Enable/Install some wayland tools";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      satty
      grim
      slurp
      hyprlock
      hypridle
      wl-clipboard
      brightnessctl
      swww
    ];
  };
}
