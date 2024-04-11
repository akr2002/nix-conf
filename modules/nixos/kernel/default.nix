{pkgs, ...}: {
  boot = {
    kernelModules = ["kvm-intel" "snd-hda-intel" "i8042" "nf_nat_ftp"];
    extraModprobeConfig = ''
      options snd-hda-intel model=alc255-acer,dell-headset-multi
      options i8042 nopnp=1
    '';
    kernelParams = ["allow-discards"];
    kernel.sysctl = {
      "net.ipv4.conf.all.forwarding" = true;
      "net.ipv4.conf.default.forwarding" = true;
    };
    hardware.firmware = with pkgs; [firmwareLinuxNonfree];
  };
}
