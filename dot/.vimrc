"---------GENERAL SETTINGS------------

"Set compatibility to Vim only.
set nocompatible
set nolist
set rnu

"Helps force plug-ins to load correctly when it is turned back on below.
filetype on

" Turn on syntax highlighting.
syntax on

" For plug-ins to load correctly.
filetype plugin indent on

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Show line numbers
set number

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch

" Enable incremental search
set incsearch

" Include matching uppercase words with lowercase search term
set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100


" ---------------PLUGINS--------------------
"
"Plugin autoinstalling
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

""Syntax highlighting and autocompletion
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
 Plug 'OmniSharp/omnisharp-vim'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'nickspoons/vim-sharpenup'
Plug 'alvan/vim-closetag'

""File search and navigation
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'

""Editor interface and theming

Plug 'ryanoasis/vim-devicons'
Plug 'yggdroot/indentline'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-commentary'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" colorscheme wal

"lsp-complete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

"Debugging, refactoring and version control
"Plug 'puremourning/vimspector'

Plug 'gmarik/Vundle.vim'

call plug#end()

"---------- PLUGIN VARIABLES---------------
"
" let g:coc_global_extensions = [ 'coc-tsserver' ]
" let g:airline_powerline_fonts = 1
" autocmd VimEnter * NERDTree | wincmd p
" " Exit Vim if NERDTree is the only window remaining in the only tab.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" set bg=dark

"-----------NAVIGATION KEYMAPS-------------
"
" GoTo code navigation.

noremap <C-b> :NERDTreeToggle<cr>
noremap <C-s> :w<cr>
noremap <C-x> :dp<cr>
noremap <C-a> :terminal<cr>
"hide bar oui jaime bien ce qui est minimaliste
nnoremap <S-h> :call ToggleHiddenAll()<CR>

"oui ma prof d'algorithmique n'aime pas quand on a la coloration syntaxique
nnoremap <C-h> :call ToggleSyntax()<CR>

" Move 1 more lines up or down in normal and visual selection modes.
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"Autosave folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"Search shortcuts
"let mapleader = ","
noremap <leader>fs :Files<cr>

" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
nnoremap <F3> :call RunCode()<CR>

set pastetoggle=<F2>

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

function RunCode()
	if &ft == 'c'
    w !make && make run
  elseif &ft == 'python'
    w !python %:p
  elseif &ft == "cs"
    w !dotnet run
  endif
endfunction

call ToggleHiddenAll()
