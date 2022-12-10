{ config, pkgs, inputs, ... }:
let
  inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) vimThemeFromScheme;
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins;
      [
        {
          plugin = telescope-nvim;
          type = "lua";
          config = ''
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
          '';
        }

        {
          plugin = lualine-nvim;
          config = "lua require('lualine').setup()";
        }
        {
          plugin = vimThemeFromScheme { scheme = config.colorscheme; };
          config = "colorscheme nix-${config.colorscheme.slug}";
        }
        {
          plugin = (nvim-treesitter.withPlugins (plugins:
            with plugins; [
              tree-sitter-bash
              tree-sitter-nix
              tree-sitter-markdown
              tree-sitter-ruby
              tree-sitter-vim
            ])
          );
          type = "lua";
          config = ''
            require 'nvim-treesitter.configs'.setup {
              highlight = { enable = true },
              indent = { enable = true },
            }
          '';
        }
        vim-floaterm
        # Dependencies
        popfix
        plenary-nvim
        nvim-web-devicons
      ];
    extraConfig = ''
      set nocompatible
      syntax on
      set noerrorbells

      " Always show status
      set laststatus=2

      " Open new splits left and down
      set splitbelow
      set splitright

      " Use regular and relative linenumbers
      set number relativenumber

      " Case insensitive until uppercase
      set smartcase

      " Display extra whitespace
      set list listchars=tab:»·,trail:·,nbsp:·

      " F5 to remove all trailing whitespace
      :nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

      " Show cursor line when F4 is pressed
      nnoremap <silent> <F4> :set cursorline!<CR>

      " Set Tabs
      set tabstop=2
      set softtabstop=2
      set shiftwidth=2
      set expandtab

      " Be smart about indentation
      filetype plugin indent on
      set smartindent

      " Don't backup, just use undo, that's what git is for
      set noswapfile
      set nobackup
      set undodir=~/.vim/undodir
      set undofile

      " Incremental search highlight
      set incsearch

      " No Arrow Keys
      noremap <Up> <NOP>
      noremap <Down> <NOP>
      noremap <Left> <NOP>
      noremap <Right> <NOP>

      " Leader=<Space>
      let mapleader=" "
      nnoremap <leader>w <C-w>v<C-w>l

      " F2 -> toggle paste mode
      set pastetoggle=<F2>

      " Ctrl+Backspace erases word to the left in insert and command-line modes
      noremap! <C-H> <C-W>

      " Ctrl+Del erases word to the right in insert mode
      inoremap <C-kDel> <space><ESC>ce

      "This unsets the "last search pattern" register by hitting return
      nnoremap <CR> :noh<CR><CR>
    '';
  };
}
