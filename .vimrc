" Not using this, using color override below to set black. Can set this, but
" powerline bg won't pick it up.
" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    "autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

" \ "black": {"gui": "#000000", "cterm": "0", "cterm16": "0" }
" let g:onedark_color_overrides = {
" \ "black": {"gui": "#282C34", "cterm": "0", "cterm16": "0" }
" \}

colorscheme onedark
syntax on

set ic is
set scs
set hlsearch
set so=10

" set tabstop=4
set shiftwidth=4
set expandtab

" TODO set up some shortcut for bwipeout

" let g:goyo_height = "90%"
let g:goyo_height = 80
let g:goyo_width = 100

let mapleader = ","

" NERDTree Mappings
map <C-n> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Turn off default mappings
let g:NERDCreateDefaultMappings = 0

" Map toggle comment
nmap <leader>cc <plug>NERDCommenterToggle 
xmap <leader>cc <plug>NERDCommenterToggle

" Format selected code
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Set the cursor for insert mode vs normal mode
" https://stackoverflow.com/questions/6488683/how-do-i-change-the-cursor-between-normal-and-insert-modes-in-vim
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
" Other command options
" Ps = 0  -> blinking block.
" Ps = 1  -> blinking block (default).
" Ps = 2  -> steady block.
" Ps = 3  -> blinking underline.
" Ps = 4  -> steady underline.
" Ps = 5  -> blinking bar (xterm).
" Ps = 6  -> steady bar (xterm).


" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Needed for commenting plugin
filetype plugin on
" Todo check out how to open window for preview

call plug#begin('~/.vim/plugged')
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-plug'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
call plug#end()
