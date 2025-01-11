{
  config,
  inputs,
  ...
}: let
  inherit (import ../../../options.nix) flakeDir homeConfigDir;
in {
  home.file.".config/nvim" = {
    source = "${inputs.nvim-config}";
    recursive = true;
  };

  home.file.".config/hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink "${homeConfigDir}/hypr/";
    recursive = true;
  };

  home.file = {
    ".config/fcitx5" = {
      source = config.lib.file.mkOutOfStoreSymlink "${homeConfigDir}/fcitx5";
      recursive = true;
    };

    ".config/hyprpanel" = {
      source = config.lib.file.mkOutOfStoreSymlink "${homeConfigDir}/hyprpanel";
      recursive = true;
    };

    ".local/bin" = {
      source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/home/bin";
      recursive = true;
    };

    ".clang-format".text = "IndentWidth: 4";

    ".config/npm/npmrc".text = ''
      prefix=''${XDG_DATA_HOME}/npm
      cache=''${XDG_CACHE_HOME}/npm
      tmp=''${XDG_RUNTIME_DIR}/npm
      init-module=''${XDG_CONFIG_HOME}/npm/config/npm-init.js
      color=true'';
  };
}
