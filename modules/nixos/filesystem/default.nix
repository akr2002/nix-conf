_: {
  fileSystems."/".options = ["noatime" "nodiratime" "discard"];
  # Enable swap on luks
  boot.initrd.luks.devices."luks-3b571a97-616b-4dd7-9abb-d1e0491d178a".device = "/dev/disk/by-uuid/3b571a97-616b-4dd7-9abb-d1e0491d178a";
  boot.initrd.luks.devices."luks-3b571a97-616b-4dd7-9abb-d1e0491d178a".allowDiscards = true;

  # Allow discard on /
  boot.initrd.luks.devices."luks-a09877ce-f520-429a-9f3b-57b073e4d662".device = "/dev/disk/by-uuid/a09877ce-f520-429a-9f3b-57b073e4d662";
  boot.initrd.luks.devices."luks-a09877ce-f520-429a-9f3b-57b073e4d662".allowDiscards = true;
}
