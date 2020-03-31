call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'roxma/nvim-completion-manager'
Plug 'ncm2/ncm2-bufword' 
Plug 'ncm2/ncm2-path' 
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }  }
Plug 'OmniSharp/omnisharp-vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'gko/vim-coloresque'
Plug 'burnettk/vim-angular'
call plug#end()

colorscheme gruvbox

set number
set relativenumber
set mouse=a
set inccommand=split
set background=dark
let mapleader="\<space>"

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

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
".....................................
" Csharp Config Test
".....................................
"
" Note: this is required for the plugin to work
filetype indent plugin on
let g:OmniSharp_translate_cygwin_wsl = 1
let g:OmniSharp_server_stdio = 1


let g:OmniSharp_server_path = '/mnt/c/OmniSharp/omnisharp-win-x64/OmniSharp.exe'

let g:OmniSharp_timeout = 10
" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview
" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:OmniSharp_highlight_types = 2
" Update semantic highlighting after all text changes
"let g:OmniSharp_highlight_types = 3
"
" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5

augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Enable snippet completion
" let g:OmniSharp_want_snippet=1

"filetype indent plugin on
"let g:OmniSharp_server_path= '/mnt/c/OmniSharp/omnisharp-win-x64/OmniSharp.exe'
"let g:OmniSharp_translate_cygwin_wsl = 1
" Set the type lookup function to use the preview window instead of echoing it
"let g:OmniSharp_typeLookupInPreview = 1



"let g:OmniSharp_timeout = 10

"set completeopt=longest,menuone,preview

"set previewheight=5

"ale onluy cs files
"let g:ale_linters = { 'cs': ['OmniSharp'] }
"let g:syntastic_cs_checkers = ['code_checker']

"let g:OmniSharp_highlight_types = 3

"augroup omnisharp_commands
"	autocmd!

"	autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
"augroup END
