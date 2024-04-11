_: {
  environment = {
    homeBinInPath = true; # Include ~/bin/ in $PATH
    localBinInPath = true; # Include ~/.local/bin in $PATH
    sessionVariables = {
      # tell electron apps to use wayland
      NIXOS_OZONE_WL = "1";
    };
  };
}
