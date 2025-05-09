{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    nixvim.enable = lib.mkEnableOption "enable nixvim";
  };
  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      enable = true;
      imports = [ pkgs.inputs.neve.nixvimModule ];
      plugins = {
      };
      extraPlugins = with pkgs.vimPlugins; [
        ultisnips
      ];
    };
  };
}
