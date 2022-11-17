{ pkgs, ...}: {
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ vim-airline ];
    settings = { 
      expandtab = true;
      smartcase = true;
      number = true;
      relativenumber = true;
    };
    extraConfig = ''
      set nocompatible
      syntax on
      set noerrorbells

      " Always show status
      set laststatus=2

      " Open new splits left and down
      set splitbelow
      set splitright

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

    '';
  };
}
