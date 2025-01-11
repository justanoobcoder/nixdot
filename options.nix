let
  # You're not me and I'm not you. So define our own values.
  username = "hiepnh";
  fullname = "Nguyen Hong Hiep";
  email = "syaorancode@gmail.com";
  hostname = "nixos-pc";
  # run `mkpasswd -m sha-512 yourpassword` to generate the hashed password
  hashedPassword = "$6$oZdux9tYWX4C5UvT$AS91kxEq43FPPZX/In289dgVIo6NYphArKDt5QhGMABaiS8XsO8uq/JLvHxkXKvNLe471R3ZPdL52CXMkQU5B.";
  flakeDir = "/home/${username}/dotfiles"; # the directory where you cloned this repository
  gpu = "hybrid"; # available options: hybrid, nvidia, intel
in {
  version = "24.11"; # CHANGE THIS TO CURRENT NIXOS VERSION
  username = username;
  fullname = fullname;
  hostname = hostname;
  hashedPassword = hashedPassword;
  gitUsername = fullname;
  gitEmail = email;
  flakeDir = flakeDir;
  homeConfigDir = "${flakeDir}/home/config";
  locale = "en_US.UTF-8";
  keyboardLayout = "us";
  timezone = "Asia/Ho_Chi_Minh";
  system = "x86_64-linux"; # DO NOT CHANGE THIS OPTION
  logitech = true;
  gpu = gpu;
  dev = {
    java = {
      enable = true;
      jdk = "jdk23";
    };
    go = {
      enable = false;
    };
  };
  terminal = {
    # available options: foot, alacritty, kitty
    # remember to change $terminal value in `home/config/hypr/modules/binds.conf` too
    name = "foot";
    font = {
      name = "JetBrainsMono Nerd Font"; # make sure you have this font installed
      size = 12;
    };
    opacity = 0.8;
    colorScheme = {
      bright = {
        black = "928374";
        blue = "83a598";
        cyan = "8ec07c";
        green = "b8bb26";
        magenta = "d3869b";
        red = "fb4934";
        white = "ebdbb2";
        yellow = "fabd2f";
      };

      normal = {
        black = "282828";
        blue = "458588";
        cyan = "689d6a";
        green = "98971a";
        magenta = "b16286";
        red = "cc241d";
        white = "a89984";
        yellow = "d79921";
      };

      primary = {
        background = "282828";
        foreground = "ebdbb2";
      };
    };
  };
}
