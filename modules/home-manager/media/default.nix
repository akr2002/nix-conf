{pkgs, ...}: {
  home.packages = with pkgs; [
    x264
    mpv
  ];
}
