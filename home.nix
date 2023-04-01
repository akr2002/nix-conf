{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "user";
  home.homeDirectory = "/home/user";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.packages = [
	pkgs.wget
	pkgs.neofetch
	pkgs.htop
	pkgs.oh-my-zsh
	pkgs.git
	pkgs.chromium
	pkgs.gdb
	pkgs.clang
	pkgs.lldb
	pkgs.kitty
	pkgs.xsel
  ];

	programs.bash = {
		enable = true;
		bashrcExtra = ''
			. ~/bashrc
		'';	
	};

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		enableAutosuggestions = true;
		enableSyntaxHighlighting = true;
		oh-my-zsh = {
			enable = true;
			theme = "ys";
			plugins = ["git" "colored-man-pages" "extract" "sudo"];
		};
	};

}
