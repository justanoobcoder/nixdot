{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  name = "screenshot";
  cfg = config.features.gui.${name};
in {
  options.features.gui.${name}.enable = mkEnableOption "Enable screenshot feature";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      satty
      grim
      slurp
    ];

    home.file.".config/satty/config.toml".text = ''
      [general]
      fullscreen = true
      early-exit = true
      corner-roundness = 12
      initial-tool = "brush"
      copy-command = "wl-copy"
      annotation-size-factor = 0.3
      output-filename = "${config.xdg.userDirs.pictures}/screenshots/screenshot-%Y-%m-%d_%H:%M:%S.png"
      action-on-enter = "save-to-file"
      save-after-copy = false
      default-hide-toolbars = false
      primary-highlighter = "block"
      disable-notifications = false

      [font]
      family = "Roboto"
      style = "Bold"

      [color-palette]
      palette = [
          "#a52a2a",
          "#00ffff",
          "#dc143c",
          "#ff1493",
          "#ffd700",
          "#008000",
      ]

      custom = [
          "#a52a2a",
          "#00ffff",
          "#dc143c",
          "#ff1493",
          "#ffd700",
          "#008000",
      ]
    '';
  };
}
