# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{pkgs, ...}: let
  inherit (import ../../options.nix) hostname version timezone locale keyboardLayout;
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules
  ];

  # Bootloader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  networking.hostName = hostname; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = locale;

  #i18n.extraLocaleSettings = {
  #  LC_ADDRESS = "vi_VN";
  #  LC_IDENTIFICATION = "vi_VN";
  #  LC_MEASUREMENT = "vi_VN";
  #  LC_MONETARY = "vi_VN";
  #  LC_NAME = "vi_VN";
  #  LC_NUMERIC = "vi_VN";
  #  LC_PAPER = "vi_VN";
  #  LC_TELEPHONE = "vi_VN";
  #  LC_TIME = "vi_VN";
  #};

  i18n = {
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        addons = [pkgs.fcitx5-bamboo];
        waylandFrontend = true;
      };
    };
  };

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = keyboardLayout;
    variant = "";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

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

  # List services that you want to enable:
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

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = version; # Did you read the comment?
}
