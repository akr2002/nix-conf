{
  config,
  libs,
  ...
}: {
  options = {
    virtualisation.enable = lib.mkEnableOption "enable virtualisation";
  };
  config = lib.mkIf config.virtualisation.enable {
    virtualisation = {
      docker.enable = true;
      incus.enable = true;
      libvirtd.enable = true;
      lxc = {
        enable = true;
        lxcfs.enable = true;
      };
      waydroid.enable = true;
    };
  };
}
