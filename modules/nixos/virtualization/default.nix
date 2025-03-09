{
  config,
  lib,
  ...
}: {
  options = {
    virtualization.enable = lib.mkEnableOption "enable virtualization";
  };
  config = lib.mkIf config.virtualization.enable {
    virtualisation = {
      docker.enable = true;
      incus.enable = false;
      libvirtd.enable = true;
      lxc = {
        enable = true;
        lxcfs.enable = true;
      };
      waydroid.enable = true;
    };
  };
}
