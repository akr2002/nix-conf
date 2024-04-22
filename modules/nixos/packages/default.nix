{pkgs, ...}: {
  environment.systemPackages =
    (with pkgs; [
      vim
      wget
      git
      nh
      nix-output-monitor
      nvd
    ])
    ++ (with pkgs.masterPkgs; [
      ollama
    ]);
}
