call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword' 
Plug 'ncm2/ncm2-path' 
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }  }
call plug#end()

colorscheme gruvbox

set number
set mouse=a
set inccommand=split
set background=dark
let mapleader="\<space>"

nnoremap <leader>; A;<esc>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>
" ....................................
" plasticboy/vim-markdown
" ....................................
 autocmd FileType markdown let b:sleuth_automatic=0
 autocmd FileType markdown set conceallevel=0
 autocmd FileType markdown normal zR

 let g:vim_markdown_frontmatter=1

".....................................
" iamcco/markdown-preview.nvim
".....................................
"
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='/home/pflausino/tools/github-markdown.css'
