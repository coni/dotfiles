call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'tpope/vim-commentary'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ryanoasis/vim-devicons'
    Plug 'github/copilot.vim'
call plug#end()

"-----------KEYMAPS-------------
"only builtin
noremap <C-s> :w<cr>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
nnoremap <C-f> :FZF<CR>
nnoremap <C-j> 10j
nnoremap <C-k> 10k
nnoremap <C-h> :set number!<cr>
nnoremap <C-c> :call system("wl-copy", @")<CR>
" nnoremap <C-b> :call ToggleNetrw()<cr>
nnoremap <C-b> :NERDTreeToggle<CR>
" nnoremap <C-a> :call StripWhitespace()<cr>
nnoremap <C-S-h> :wq<cr>
nnoremap <F2> :set invpaste paste?<CR>
nnoremap <C-@> :call system("wl-copy", @")<CR>
" nnoremap <C-p> :Termdebug<CR>
vnoremap < <gv
vnoremap > >gv
set pastetoggle=<F2>
nnoremap <C-o> :Copilot panel<CR>

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <c-@> coc#refresh()

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"set omnifunc=ale#completion#OmniFunc
"let b:ale_fixers = {'c': ['gcc']}

" ---------GENERAL SETTINGS------------

"Set compatibility to Vim only.
set autoindent
set nolist
set clipboard=unnamedplus
set nocompatible
filetype on
syntax on
colorscheme rosepine
" colorscheme catppuccin_frappe
filetype plugin indent on
set noruler
set mouse=a

set modelines=0
set wrap
set textwidth=80
set cc=80
set formatoptions=tcqrn1
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set wildmenu
set autoread
set autowrite
set list
set listchars=tab:»\ ,trail:·,eol:$

set scrolloff=10
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
set ignorecase
set smartcase
set shortmess+=F

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" ---------------PLUGINS--------------------

"Plugin autoinstalling
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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

function! StripWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
