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
      colorschemes.catpuccin.enable = lib.mkForce false;
      colorschemes.nord.enable = true;
      plugins = {

      };
      extraPlugins = with pkgs.vimPlugins; [
        ultisnips
      ];
    };
  };
}
