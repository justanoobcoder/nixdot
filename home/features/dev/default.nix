{pkgs, ...}: let
  inherit (import ../../../options.nix) gitUsername gitEmail;
in {
  imports = [
  ];
  programs = {
    git = {
      enable = true;
      userName = "${gitUsername}";
      userEmail = "${gitEmail}";
    };

    lazygit = {
      enable = true;
    };
  };
}
