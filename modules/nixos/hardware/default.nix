{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    hardware.enable = lib.mkEnableOption "enable hardware options";
  };
  config = lib.mkIf config.hardware.enable {
    environment.sessionVariables = {LIBVA_DRIVER_NAME = "iHD";};
    hardware = {
      opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
        extraPackages = with pkgs; [vaapiIntel vaapiVdpau libvdpau-va-gl intel-media-driver intel-vaapi-driver];
      };
    };
    nixpkgs.config.packageOverrides = pkgs: {
      vaapiIntel = pkgs.vaapiIntel.override {enableHybridCodec = true;};
      intel-vaapi-driver = pkgs.intel-vaapi-driver.override {enableHybridCodec = true;};
    };
  };
}
