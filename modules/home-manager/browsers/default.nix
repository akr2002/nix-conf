{pkgs, ...}: {
  home.packages = with pkgs; [
    chromium
    vivaldi
    vivaldi-ffmpeg-codecs
    tor-browser
  ];
}
