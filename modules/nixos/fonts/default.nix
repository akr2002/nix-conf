{pkgs, ...}: {
  fonts.packages = with pkgs; [
    source-han-serif
    noto-fonts-emoji
    noto-fonts-cjk
  ];
}
