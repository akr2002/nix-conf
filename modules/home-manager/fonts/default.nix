{pkgs, ...}: {
  nixpkgs.config.joypixels.acceptLicense = true;
  home.packages = with pkgs; [
    jetbrains-mono
    joypixels
  ];
}
