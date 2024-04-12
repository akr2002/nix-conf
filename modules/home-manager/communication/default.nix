{pkgs, ...}: {
  home.packages = with pkgs; [
    dino
    tdesktop
  ];
}
