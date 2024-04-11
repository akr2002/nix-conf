{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    vscode.enable = lib.mkEnableOption "enable vscode";
  };
  config = lib.mkIf config.vscode.enable {
    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        arrterian.nix-env-selector
        mkhl.direnv
        jnoortheen.nix-ide

        xaver.clang-format
        llvm-vs-code-extensions.vscode-clangd
        vadimcn.vscode-lldb
        # ms-vscode.cpptools
        colejcummins.llvm-syntax-highlighting

        rust-lang.rust-analyzer

        waderyan.gitblame
      ];
    };
  };
}
