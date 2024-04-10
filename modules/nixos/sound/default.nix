{
  config,
  lib,
  ...
}: {
  options = {
    sound.enable = lib.mkEnableOption "enable sound";
  };
  config = lib.mkIf config.sound.enable {
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
