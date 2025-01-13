{...}: {
  services = {
    openssh = {
      enable = true;
      settings.PermitRootLogin = "no";
      allowSFTP = true;
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    #udisks2.enable = true;
    power-profiles-daemon.enable = true;
    upower.enable = true;
    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = ["*"];
          settings = {
            main = {
              capslock = "overload(control, esc)";
              esc = "capslock";
            };
          };
        };
      };
    };
  };

  #virtualisation.docker = {
  #  enable = true;
  #  enableOnBoot = false;
  #};

  systemd.services.warp-svc = {
    description = "Cloudflare WARP";
    serviceConfig = {
      Type = "exec";
      ExecStart = "/run/current-system/sw/bin/warp-svc";
      ExecStop = "pkill warp-svc";
      Restart = "on-failure";
    };
    wantedBy = ["default.target"];
  };
  systemd.services.warp-svc.enable = true;
}
