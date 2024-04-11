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
  };
}
