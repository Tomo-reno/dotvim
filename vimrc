set encoding=utf-8
scriptencoding utf-8

set fileencoding=utf-8
set fileencodings=utf-8

" ------setting vim-plug--------
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-jp/vimdoc-ja'
Plug 'mattn/webapi-vim' 
Plug 'kazukazuinaina/Weather.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/gina.vim'
call plug#end()

" setting vim
syntax enable
filetype plugin indent on
colorscheme gruvbox

set background=light
set number
set nobackup
set noswapfile
set backspace=indent,eol,start
set hlsearch
set incsearch

" setting keybind
nnoremap <ESC><ESC> :noh<CR>

" ------airline settings--------
set ttimeoutlen=10
let g:airline#extensions#virtualenv#enabled = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"言語別にインデントを分ける"
augroup MyFileTypeEvent
	autocmd!
	autocmd FileType py setlocal tabstop=4 softtabstop=4 shiftwidth=4
	autocmd FileType rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
	autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
	autocmd FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
	autocmd FileType eruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

function Indent()
	let save_cursor = getcurpos()
	execute "normal " . "gg=G"
	call setpos('.', save_cursor)
endfunction
command -nargs=0 Indent call Indent()
