{ pkgs, ... }:
{
  enable = true;
  colorschemes.gruvbox.enable = true;
  options = {
    number = true;
    relativenumber = true;
    shiftwidth = 2;
    expandtab = true;
  };

  globals.mapleader = " ";
  keymaps = [
    {
      mode = "n";
      key = "<leader>w";
      action = "<cmd>w<cr>";
      options.desc = "Save";
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "<cmd>confirm q<cr>";
      options.desc = "Quit";
    }
    {
      mode = "n";
      key = "<leader>Q";
      action = "<cmd>qall<cr>";
      options.desc = "Quit all";
    }
    {
      mode = "n";
      key = "<leader>n";
      action = "<cmd>enew<cr>";
      options.desc = "New File";
    }
    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w!<cr>";
      options.desc = "Force write";
    }
    {
      mode = "n";
      key = "<C-q>";
      action = "<cmd>qa!<cr>";
      options.desc = "Force quit";
    }
    {
      mode = "n";
      key = "|";
      action = "<cmd>vsplit<cr>";
      options.desc = "Vertical Split";
    }
    {
      mode = "n";
      key = "\\";
      action = "<cmd>split<cr>";
      options.desc = "Horizontal split";
    }
    {
      mode = "n";
      key = "<leader>c";
      action = "<cmd>bd<cr>";
      options.desc = "Close buffer";
    }
    {
      mode = "n";
      key = "<leader>[";
      action = "<cmd>bp<cr>";
      options.desc = "Switch to previous buffer";
    }
    {
      mode = "n";
      key = "<leader>]";
      action = "<cmd>bn<cr>";
      options.desc = "Switch to next buffer";
    }
    {
      mode = "n";
      key = "g]";
      action = "<cmd>GitGutterNextHunk<cr>";
      options.desc = "Next Git hunk";
    }
    {
      mode = "n";
      key = "g[";
      action = "<cmd>GitGutterPrevHunk<cr>";
      options.desc = "Previous Git hunk";
    }
    {
      mode = "n";
      key = "gp";
      action = "<cmd>GitGutterPreviewHunk<cr>";
      options.desc = "Preview Git hunk";
    }
    {
      mode = "n";
      key = "gSs";
      action = "<cmd>GitGutterStageHunk<cr>";
      options.desc = "Stage Git hunk";
    }
    {
      mode = "n";
      key = "gSs";
      action = "<cmd>GitGutterStageHunk<cr>";
      options.desc = "Stage Git hunk";
    }
    {
      mode = "n";
      key = "gSu";
      action = "<cmd>GitGutterUndoHunk<cr>";
      options.desc = "Undo Git hunk";
    }
    {
      key = "gd";
      action = "<cmd>GitGutterDiffOrig<cr>";
      options.desc = "View Git diff";
    }
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<cr>";
      options.desc = "Toggle Neotree";
    }
    {
      mode = "n";
      key = "<leader>tf";
      action = "<cmd>FloatermToggle<cr>";
      options.desc = "Togggle floating terminal";
    }
    {
      key = "<leader>oe";
      action = ":Ollama Explain_Code<CR>";
      options.desc = "Explain Code Snippet";
    }
    {
      key = "<leader>oo";
      action = ":Ollama Raw<CR>";
      options.desc = "Ask LLM";
    }
    {
      key = "<leader>os";
      action = ":Ollama Simplify_Code<CR>";
      options.desc = "Simplify code snippet";
    }
  ];
  plugins = {
    alpha = {
      enable = true;
      theme = "dashboard";
    };
    auto-save = {
      enable = false;
      enableAutoSave = true;
    };
    barbar = {
      enable = true;
      animation = true;
      clickable = true;
    };
    barbecue = {
      enable = true;
    };
    bufferline = {
      enable = true;
    };
    chadtree = {
      enable = false;
    };
    clangd-extensions = {
      enable = true;
    };
    cmp-buffer = {
      enable = true;
    };
    cmp-cmdline = {
      enable = true;
    };
    cmp-cmdline-history = {
      enable = true;
    };
    cmp-dap = {
      enable = true;
    };
    cmp-dictionary = {
      enable = true;
    };
    cmp-digraphs = {
      enable = true;
    };
    cmp-emoji = {
      enable = true;
    };
    cmp-fuzzy-buffer = {
      enable = true;
    };
    cmp-fuzzy-path = {
      enable = true;
    };
    cmp-latex-symbols = {
      enable = true;
    };
    cmp-git = {
      enable = true;
    };
    cmp-look = {
      enable = true;
    };
    cmp-nvim-lsp = {
      enable = true;
    };
    cmp-nvim-lsp-document-symbol = {
      enable = true;
    };
    cmp-nvim-lsp-signature-help = {
      enable = true;
    };
    cmp-nvim-lua = {
      enable = true;
    };
    cmp-nvim-ultisnips = {
      enable = true;
    };
    cmp-omni = {
      enable = true;
    };
    cmp-path = {
      enable = true;
    };
    cmp-rg = {
      enable = true;
    };
    cmp-spell = {
      enable = true;
    };
    cmp-treesitter = {
      enable = true;
    };
    cmp-vim-lsp = {
      enable = true;
    };
    cmp-zsh = {
      enable = true;
    };
    cmp_luasnip = {
      enable = true;
    };
    comment-nvim = {
      enable = true;
    };
    coq-nvim = {
      enable = true;
      alwaysComplete = true;
      autoStart = true;
      installArtifacts = true;
      recommendedKeymaps = true;
    };
    crates-nvim = {
      enable = true;
    };
    cursorline = {
      enable = true;
      cursorline.number = true;
      cursorline.timeout = 0;
    };
    dap = {
      enable = true;
      extensions = {
        dap-python = {
          enable = true;
        };
        dap-ui = {
          enable = true;
        };
      };
    };
    dashboard = {
      enable = true;
      footer = [ "Footer text" ];
      header = [ "Header text" ];
    };
    diffview = {
      enable = true;
    };
    efmls-configs = {
      setup = {
        all.linter = [ "codespell" ];
        bash.formatter = [ "beautysh" ];
        c = {
          formatter = [ "clang_tidy" ];
          linter = [ "clang_tidy" ];
        };
        "c++" = {
          formatter = [ "clang_tidy" ];
          linter = [ "clang_tidy" ];
        };
        cmake = {
          formatter = [ "gersemi" ];
          linter = [ "cmake_lint" ];
        };
        css = {
          formatter = [ "prettier" ];
          linter = [ "proselint" ];
        };
        gitcommit.linter = [ "gitlint" ];
        html = {
          formatter = [ "prettier" ];
          linter = [ "proselint" ];
        };
        lua = {
          formatter = [ "lua_format" ];
          linter = [ "luacheck" ];
        };
        markdown = {
          formatter = [ "mdformat" ];
          linter = [ "proselint" ];
        };
        nix = {
          formatter = [ "nixfmt" ];
          linter = [ "statix" ];
        };
        python = {
          formatter = [ "black" ];
          linter = [ "ruff" ];
        };
        rust.formatter = [ "rustfmt" ];
        sh = {
          formatter = [ "beautysh" ];
          linter = [ "shellcheck" ];
        };
        tex = {
          formatter = [ "latexindent" ];
          linter = [ "chktex" ];
        };
        vim.linter = [ "vint" ];
        zsh.formatter = [ "beautysh" ];
      };
    };
    endwise = {
      enable = true;
    };
    fidget = {
      enable = true;
      integration.nvim-tree.enable = true;
    };
    flash = {
      enable = true;
    };
    floaterm = {
      enable = true;
    };
    git-worktree = {
      enable = true;
      enableTelescope = false;
    };
    gitblame = {
      enable = true;
    };
    gitgutter = {
      enable = true;
    };
    hmts = {
      enable = true;
    };
    illuminate = {
      enable = true;
    };
    image = {
      enable = true;
      backend = "ueberzug";
    };
    inc-rename = {
      enable = true;
    };
    indent-blankline = {
      enable = true;
    };
    intellitab = {
      enable = true;
    };
    leap = {
      enable = true;
    };
    lightline = {
      enable = true;
    };
    lint = {
      enable = true;
    };
    lsp = {
      enable = true;
      servers = {
        bashls = {
          enable = true;
          autostart = true;
        };
        clangd = {
          enable = true;
          autostart = true;
          cmd = [ "clangd" "--offset-encoding=utf-16" ];
          extraOptions = { };
        };
        cmake = {
          enable = true;
          autostart = true;
        };
        cssls = {
          enable = true;
          autostart = true;
        };
        dockerls = {
          enable = true;
          autostart = true;
        };
        efm = {
          enable = true;
          autostart = true;
        };
        html = {
          enable = true;
          autostart = true;
        };
        ltex = {
          enable = false;
          autostart = true;
        };
        lua-ls = {
          enable = true;
          autostart = true;
        };
        marksman = {
          enable = true;
          autostart = true;
        };
        nil_ls = {
          enable = true;
          autostart = true;
        };
        pyright = {
          enable = true;
          autostart = true;
        };
        rust-analyzer = {
          enable = true;
          autostart = true;
          installCargo = true;
          installRustc = true;
        };
        texlab = {
          enable = true;
          autostart = true;
        };
      };
    };
    lsp-format = {
      enable = true;
    };
    lsp-lines = {
      enable = true;
    };
    lspkind = {
      enable = true;
      cmp = {
        enable = true;
      };
    };
    lspsaga = {
      enable = true;
      beacon = {
        enable = true;
      };
    };
    luasnip = {
      enable = true;
    };
    magma-nvim = {
      enable = true;
      automaticallyOpenOutput = true;
      imageProvider = "ueberzug";
      wrapOutput = true;
    };
    markdown-preview = {
      enable = true;
      autoStart = true;
    };
    navbuddy = {
      enable = true;
      lsp.autoAttach = true;
    };
    neo-tree = {
      enable = true;
      enableGitStatus = true;
      enableModifiedMarkers = true;
      enableRefreshOnWrite = true;
    };
    neorg = {
      enable = true;
      lazyLoading = true;
    };
    nix = {
      enable = true;
    };
    nix-develop = {
      enable = true;
    };
    none-ls = {
      enable = true;
      enableLspFormat = true;
    };
    nvim-autopairs = {
      enable = true;
    };
    nvim-bqf = {
      enable = true;
      autoEnable = true;
      preview = {
        autoPreview = true;
        bufLabel = true;
      };
    };
    nvim-cmp = {
      enable = true;
      autoEnableSources = true;
      formatting.expandableIndicator = true;
    };
    nvim-colorizer = {
      enable = true;
    };
    nvim-tree = {
      enable = true;
    };
    nvim-ufo = {
      enable = false;
    };
    obsidian = {
      enable = true;
    };
    ollama = {
      enable = true;
      model = "tinyllama";
      url = "http://127.0.0.1:11435";
    };
    packer = {
      enable = true;
    };
    project-nvim = {
      enable = true;
    };
    quickmath = {
      enable = true;
    };
    rainbow-delimiters = {
      enable = true;
    };
    refactoring = {
      enable = true;
    };
    rust-tools = {
      enable = true;
    };
    rustaceanvim = {
      enable = true;
    };
    sniprun = {
      enable = true;
    };
    spider = {
      enable = true;
    };
    surround = {
      enable = true;
    };
    tagbar = {
      enable = true;
    };
    telescope = {
      enable = true;
      keymaps = { };
      extensions = {
        file_browser.enable = true;
        frecency.enable = true;
        fzf-native = {
          enable = true;
          caseMode = "ignore_case";
          fuzzy = true;
        };
        fzy-native.enable = true;
        media_files.enable = true;
        project-nvim.enable = true;
        undo.enable = true;
      };
    };
    toggleterm = {
      enable = true;
    };
    treesitter = {
      enable = true;
    };
    treesitter-context = {
      enable = true;
    };
    treesitter-refactor = {
      enable = true;
    };
    trouble = {
      enable = true;
    };
    ts-autotag = {
      enable = true;
    };
    undotree = {
      enable = true;
    };
    which-key = {
      enable = true;
    };
    wilder = {
      enable = true;
    };
  };
  extraPlugins = with pkgs.vimPlugins; [
      # Rust
      rust-vim
      rust-tools-nvim
      coc-rust-analyzer
      # Treesitter
      nvim-treesitter-parsers.rust
      nvim-treesitter-parsers.cpp
      nvim-treesitter-parsers.c
      nvim-treesitter-parsers.latex
      # Coc
      coc-rls
      coc-clangd
      clangd_extensions-nvim
      vim-clang-format
      # Mason
      mason-nvim
      mason-tool-installer-nvim
      mason-lspconfig-nvim
      # Telescope
      telescope-nvim
    ];
    clipboard.providers.xsel.enable = true;
  }

