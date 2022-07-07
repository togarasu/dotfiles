" encode setting

set encoding=utf-8

" edita setting
set number
set splitbelow
set splitright
set wildmenu
set scrolloff=2

set ruler
set cursorline
highlight CursorLine ctermbg=Black
" set cursorcolumn
" highlight CursorColumn ctermbg=Yellow

" tabs
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" ---------- key bind ----------
" Normal Mode

cnoremap init :<C-u> edit $MYVIMRC<CR>

" Edit Mode
nnoremap j gj
nnoremap k gk

" Terminal
tnoremap <silent> <ESC><ESC> <C-\><C-n>
command! -nargs=* T split | wincmd j | terminal <args>
autocmd TermOpen * startinsert

" ---------- templlate ----------
autocmd BufNewFile *.c   0r $HOME/.config/nvim/template/c.txt
autocmd BufNewFile *.cpp 0r $HOME/.config/nvim/template/cpp.txt
autocmd BufNewFile *.plt 0r $HOME/.config/nvim/template/plt.txt
autocmd BufNewFile *.hs  0r $HOME/.config/nvim/template/hs.txt

" ---------- dein Scripts ----------
if &compatible
  set nocompatible               " Be iMproved
endif

" PATH for Plugin
let s:dein_dir = expand('~/.local/share/dein')

" PATH for dein.vim
let s:dein_repo_dir = s:dein_dir .  '/repos/github.com/Shougo/dein.vim'

" PATH toml
let s:toml_dir = expand('~/.config/nvim')

" Required:
execute 'set runtimepath^=' . s:dein_repo_dir

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " read toml at init
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  " read toml at use
  call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" ---------- End dein Scripts ----------

