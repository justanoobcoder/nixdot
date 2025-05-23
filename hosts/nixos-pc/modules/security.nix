{
  security.sudo.extraRules = [
    {
      groups = ["wheel"];
      commands = [
        {
          command = "/run/current-system/sw/bin/nvim";
          options = [
            "SETENV"
            "NOPASSWD"
          ];
        }
        {
          command = "/run/current-system/sw/bin/nixos-rebuild";
          options = [
            "SETENV"
            "NOPASSWD"
          ];
        }
        {
          command = "/run/current-system/sw/bin/nix-collect-garbage";
          options = [
            "SETENV"
            "NOPASSWD"
          ];
        }
        {
          command = "/run/wrappers/bin/sudoedit";
          options = [
            "SETENV"
            "NOPASSWD"
          ];
        }
        {
          command = "/run/current-system/sw/bin/mount";
          options = [
            "SETENV"
            "NOPASSWD"
          ];
        }
        {
          command = "/run/current-system/sw/bin/umount";
          options = [
            "SETENV"
            "NOPASSWD"
          ];
        }
        {
          command = "/run/current-system/sw/bin/efibootmgr";
          options = [
            "SETENV"
            "NOPASSWD"
          ];
        }
      ];
    }
  ];
}
