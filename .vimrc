"-----------KEYMAPS-------------
"only builtin
noremap <C-a> :terminal<cr>
noremap <C-s> :w<cr>
vnoremap <Space> zf
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
nnoremap <C-j> 10j
nnoremap <C-k> 10k
nnoremap <C-f> :set number!<cr>
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
nnoremap <F2> :set invpaste paste?<CR>
nnoremap <S-h> :call ToggleHiddenAll()<CR>
nnoremap <C-h> :call ToggleSyntax()<CR>
nnoremap <c-i> :call runcode(run_c, run_py, run_cs, run_default)<cr>
nnoremap <C-d> :Termdebug<CR>
nnoremap <C-n> :tabnew<CR>
nnoremap <C-S-n> :tabnew<CR>:edit 
nnoremap <C-x> :q<CR>
vnoremap < <gv
vnoremap > >gv
set pastetoggle=<F2>



" ---------GENERAL SETTINGS------------

"Set compatibility to Vim only.
set nolist
set clipboard=unnamedplus
set nocompatible

filetype on
syntax on
filetype plugin indent on
set noruler
set mouse=a

set modelines=0
set wrap
set textwidth=75
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

set scrolloff=5
set backspace=indent,eol,start
set ttyfast

"set laststatus=2 im not using it hihi 
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

set showmode
set showcmd

set matchpairs+=<:>
set number
set encoding=utf-8
set hlsearch
set incsearch
"set ignorecase
"set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" ---------------PLUGINS--------------------
packadd termdebug

"Plugin autoinstalling
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdcommenter'
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
" Plug 'dense-analysis/ale'
if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()
let g:deoplete#enable_at_startup = 1

nnoremap <C-b> :call ToggleNetrw()<cr>
let g:NetrwIsOpen=0
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
function ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

"-------------CUSTOM FUNCTIONS-----------
let s:syntax = 1
function! ToggleSyntax()
  if s:syntax == 1
    syntax off
    let s:syntax = 0
  else
    syntax on
    let s:syntax = 1
  endif
endfunction

let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
     "   set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
      endif
endfunction

let run_c="make && ./main"
let run_py="python "
let run_cs="dotnet run"
let run_default="./" . @%
function RunCode(run_c, run_py, run_cs, run_default)
	if &ft == 'c'
    execute "!" . a:run_c
  elseif &ft == 'python'
    execute "!" . a:run_py . @%
  elseif &ft == "cs"
    execute "!" . a:run_cs
  else
    execute "!" . a:run_default
  endif
endfunction
