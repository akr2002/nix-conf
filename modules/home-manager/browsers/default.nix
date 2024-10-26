{pkgs, ...}: {
  home.packages = with pkgs; [
    chromium
    microsoft-edge
    vivaldi
    vivaldi-ffmpeg-codecs
    tor-browser
  ];
}
