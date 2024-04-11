{pkgs, ...}: {
  hardware = {
    #firmware = with pkgs; [firmwareLinuxNonfree];
    opengl = {
      enable = true;
      extraPackages = with pkgs; [vaapiIntel vaapiVdpau libvdpau-va-gl intel-media-driver];
    };
  };
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override {enableHybridCodec = true;};
  };
}
