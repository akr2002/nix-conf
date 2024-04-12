{
  config,
  lib,
  ...
}: {
  options = {
    neovim.enable = lib.mkEnableOption "enable neovim";
  };
  config = lib.mkIf config.neovim.enable {
    programs.neovim = {
      enable = false;
      defaultEditor = true;
      # coc.enable = true;
      # extraLuaConfig = ''
      #  for _, source in ipairs {
      #   "astronvim.bootstrap",
      #   "astronvim.options",
      #   "astronvim.lazy",
      #   "astronvim.autocmds",
      #   "astronvim.mappings",
      # } do
      #   local status_ok, fault = pcall(require, source)
      #   if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault
      #   ) end
      # end
      #
      # if astronvim.default_colorscheme then
      # 	if not pcall(vim.cmd.colorscheme, astronvim.default_colorscheme) then
      #  requrie("astronvim.utils").notify(
      #    "Error setting up colorscheme: " .. astronvim.default_colorscheme,
      #    vim.log.levels.ERROR
      #  )
      #  end
      # end
      #
      # require("astronvim.utils").conditional_func(astronvim.user_opts("polish", nil, false), true)
      #    '';
      #
      # plugins = (with pkgs.vimPlugins; [
      # rust-vim
      # rust-tools-nvim
      # coc-rust-analyzer
      # nvim-treesitter-parsers.rust
      # nvim-treesitter-parsers.cpp
      # nvim-treesitter-parsers.c
      # nvim-treesitter-parsers.latex
      # coc-rls
      # coc-clangd
      # clangd_extensions-nvim
      # vim-clang-format
      # ]);
    };
  };
}
