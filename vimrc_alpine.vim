" using Vim Plug
call plug#begin('~/.vim/plugged')

" TODO: fix CoC
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'karoliskoncevicius/sacredforest-vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest' 
Plug 'Evalir/dosbox-vim-colorscheme'
Plug 'preservim/nerdtree'

call plug#end()


" Use <c-space> to trigger completion.
" if has('nvim')
"  inoremap <silent><expr> <c-space> coc#refresh()
" else
" inoremap <silent><expr> <c-@> coc#refresh()
" endif


" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"



" basics
syntax on
" set number
set mouse=a

" copy and paste, select all, save
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
nnoremap <C-a> ggVG
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>

" autoread and display outside changes from commands 
set autoread

" ?
filetype plugin on
set laststatus=2
set backspace=indent,eol,start

" ALE
let g:ale_c_clang_executable = '/usr/bin/clang'
let g:ale_c_clang_options = '-I/User/Desktop/posix/includes -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include'
let g:ale_enabled = 1
let g:ale_linters = {
			\   'c': ['clang'],
\ }

let g:ale_lint_on_save = 1

" Automatically run clang on save for C files
augroup clang_on_save
    autocmd!
    autocmd BufWritePost *.c,*.h execute '!/usr/bin/clang -fsyntax-only ' . expand('%')
augroup END


" color
set termguicolors
colorscheme sacredforest
colorscheme everforest
colorscheme gruvbox
colorscheme dosbox-black


" set new buffer split (like terminal) below
set splitbelow


" NERDtree 
map <C-b> :NERDTreeToggle<CR>
map <C-n> :term<CR>
map <C-h> :Hexmode<CR>
let NERDTreeShowHidden=1

let g:airline#extensions#tabline#enabled = 1
map <Tab> :bnext!<CR>

" always put terminal below
cnoremap term bel term

