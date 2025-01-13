{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  name = "cliphist";
  cfg = config.features.gui.${name};
in {
  options.features.gui.${name}.enable = mkEnableOption "Enable clipboard history feature";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      wl-clip-persist
      cliphist
    ];
  };
}
