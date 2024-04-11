{
  config,
  lib,
  ...
}: {
  options = {
    networking.enable = lib.mkEnableOption "enable networking";
  };
  config = lib.mkIf config.networking.enable {
    networking = {
      hostname = "bridge";

      networkmanager = {
        enable = true;
        unmanaged = ["virbr0" "docker0"];
      };

      nftables.enable = true;

      firewall = {
        allowedTCPPorts = [80 443];
        trustedInterfaces = ["incusbr0" "virbr0"];
      };

      extraHosts = ''
        185.199.108.133 raw.githubusercontent.com
      '';
      nameservers = ["1.1.1.1" "9.9.9.9"];
      bridges = {incusbr0.interfaces = [];};
    };
  };
}
