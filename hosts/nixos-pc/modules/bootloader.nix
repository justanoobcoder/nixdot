{pkgs, ...}: let
  inherit (import ../../../options.nix) grub;

  grubConfig = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };

  systemdBootConfig = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };
in {
  boot.loader =
    if grub.enable
    then grubConfig
    else systemdBootConfig;

  environment.systemPackages = with pkgs; [
    efibootmgr
  ];
}
