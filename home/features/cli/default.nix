{pkgs, ...}: {
  imports = [
    ./fish.nix
    ./fastfetch.nix
    ./starship.nix
    ./fzf.nix
  ];

  programs = {
    eza = {
      enable = true;
      extraOptions = ["--group-directories-first"];
    };
    zoxide.enable = true;
    btop.enable = true;
    yazi.enable = true;
    bat.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
      extraPackages = with pkgs; [
        # lua
        lua-language-server
        # nix
        nil
        alejandra
      ];
    };
  };

  home.packages = with pkgs; [
    xdg-user-dirs
    xdg-utils
    gum
    fd
  ];
}
