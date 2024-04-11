{
  config,
  lib,
  ...
}: {
  options = {
    ssh.enable = lib.mkEnableOption "enable ssh";
  };
  config = lib.mkIf config.ssh.enable {
    services.openssh.enable = true;
  };
}
