_: {
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
}
