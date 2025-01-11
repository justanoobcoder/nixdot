{
  config,
  pkgs,
  inputs,
  ...
}: let
  inherit (import ../../../options.nix) username fullname hashedPassword;
in {
  users.users.${username} = {
    hashedPassword = hashedPassword;
    isNormalUser = true;
    description = fullname;
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "video"
      "input"
      "storage"
      "power"
      "kvm"
      "libvirtd"
      "qemu-libvirtd"
    ];
    shell = pkgs.fish;
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };

  home-manager.users.${username} =
    import ../../../home/${username}/${config.networking.hostName}.nix;
}
