{pkgs, ...}: {
  home.packages = with pkgs; [
    foliate
    libreoffice-fresh
    nextcloud-client
    obsidian
    zathura
  ];
}
