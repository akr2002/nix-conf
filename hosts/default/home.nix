{
  config,
  pkgs,
  inputs,
  ...
}: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "user";
  home.homeDirectory = "/home/user";
  programs.home-manager.enable = true;

  imports = [
    #  inputs.nixvim.homeManagerModules.nixvim
    ../../modules/home-manager
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.11"; # Please read the comment before changing.

  nixpkgs.config.joypixels.acceptLicense = true;

  # Manage session variables

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    xsel
    wget
    neofetch
    htop
    oh-my-zsh
    git
    chromium
    plasma5Packages.qtstyleplugin-kvantum
    kdeconnect
    microsoft-edge
    vivaldi
    vivaldi-ffmpeg-codecs
    x264
    joypixels
    rustc
    cargo
    unzip
    ocs-url
    nextcloud-client
    duf
    foliate
    mpv
    obsidian
    dino
    aria2
    bitwarden
    kitty-themes
    p7zip
    tdesktop
    libreoffice-fresh
    jetbrains-mono
    yakuake
    krita
    filelight
    inkscape
    yt-dlp
    ranger
    libsForQt5.kwallet
    libsForQt5.kwallet-pam
    libsForQt5.kwalletmanager
    libsForQt5.ksshaskpass
    cachix
    direnv
    git-lfs
    nix-direnv
    zathura
    starship
    gnome.gnome-tweaks
    gnome-extension-manager
    ripgrep
    inputs.nv.packages.x86_64-linux.default
    inputs.nyaa.packages.x86_64-linux.default
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  programs.tmux = {
    enable = true;
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      better-mouse-mode
      #dracula
      #gruvbox
      #nord
      #onedark-theme
      #power-theme
      resurrect
      #tmux-colors-solarized
      tmux-fzf
    ];
    extraConfig = ''
      set-option -g mouse on
      set -g default-terminal "screen-256color"
    '';
  };

  #programs.nixvim = import ./nixvim.nix pkgs;

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

  programs.bat = {
    enable = true;
    config = {
      theme = "ansi";
    };
  };

  services.mpris-proxy.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  #home.file = {
  # # Building this configuration will create a copy of 'dotfiles/screenrc' in
  # # the Nix store. Activating the configuration will then make '~/.screenrc' a
  # # symlink to the Nix store copy.
  # ".screenrc".source = dotfiles/screenrc;

  # # You can also set the file content immediately.
  # ".gradle/gradle.properties".text = ''
  #   org.gradle.console=verbose
  #   org.gradle.daemon.idletimeout=3600000
  # '';
  #};
  home.file = {
    ".config/hypr".source = ../../modules/nixos/hyprland/config/hypr;
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/user/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
}
