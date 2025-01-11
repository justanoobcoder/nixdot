{prev}:
prev.fastfetch.overrideAttrs (oldAttrs: rec {
  version = "2.34.0";
  src = prev.fetchFromGitHub {
    inherit version;
    owner = "fastfetch-cli";
    repo = "fastfetch";
    rev = version;
    hash = "sha256-ZTtDYUnLp8IzGluJXLCHBxHCZAXxO+akUkPOCPMdA5w=";
  };
})
