{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    ssh.enable = lib.mkEnableOption "enable ssh";
  };
  config = lib.mkIf config.ssh.enable {
    services.openssh.enable = true;
    programs.ssh.askPassword = lib.mkForce "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";
  };
}
