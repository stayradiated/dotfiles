" Load Plugins
"
" -----------------------------------------------------------------------------

if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/dein')
 call dein#begin('~/.config/nvim/dein')
 call dein#add('~/.config/nvim/dein')

  " Themes
  call dein#add('stayradiated/vim-termorrow')
  call dein#add('reedes/vim-colors-pencil')

  " Extensions
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('jeetsukumaran/vim-filebeagle')
  call dein#add('christoomey/vim-tmux-navigator')

  " Editing
  call dein#add('scrooloose/syntastic')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-abolish')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('godlygeek/tabular')
  call dein#add('danro/rename.vim')
  call dein#add('junegunn/fzf')

  " Languages
  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')
  call dein#add('fatih/vim-go')
  call dein#add('elzr/vim-json')

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Settings
" -----------------------------------------------------------------------------

" General
set completeopt-=preview " don't show preview window
set hidden               " hide when switching buffers, don't unload
set spelllang=en_nz      " spell check with New Zealand English
set title                " use filename in window title
set gdefault             " replace everything by default
set visualbell           " stop the beep
set colorcolumn=80       " for cleaner code
set showtabline=0        " hide tab line
" set synmaxcol=120      " Limit syntax highlighting
set number
" set relativenumber
set inccommand=split     " live substitution

" Backup swap files
set backup
set backupdir=~/.config/nvim/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.config/nvim/tmp
set writebackup

" Fix for webpack-dev-server not catching file writes
" https://github.com/webpack/webpack/issues/781
set backupcopy=yes

" Infinite undo
set undofile
set undodir=~/.config/nvim/undo
set undolevels=1000
set undoreload=10000

" Folding
set foldignore=          " don't ignore anything when folding
set foldlevelstart=99    " no folds closed on open
set foldmethod=marker    " collapse code using markers
set foldmarker={,}       " set markers

" Tabs
set expandtab            " replace tabs with spaces
set shiftwidth=2         " spaces for autoindenting
set softtabstop=2        " spaces for editing, e.g. <Tab> or <BS>
set tabstop=2            " spaces for <Tab>

" Searches
set hlsearch             " highlight search results
set ignorecase           " case insensitive searching
set smartcase            " override ignorecase if upper case typed

" Colourscheme
let g:pencil_terminal_italics=1
let g:pencil_spell_undercurl=1
let g:hybrid_use_Xresources=1

colorscheme termorrow
set background=dark

" Mapping
" -----------------------------------------------------------------------------

" Map Leader to space
let mapleader = " "

" Remap Tab to %
map <BS> %

" Escape terminal mode
if has('nvim')
  tnoremap <leader>e <c-\><c-n>
endif

" Toggle fold
nnoremap <leader><space> za

" Toggle hlsearch for current results
nnoremap <leader>h :nohlsearch<CR>

" Search for trailing whitespace
nnoremap <leader>W /\s\+$<CR>

" Toggle last active bufer
nnoremap <leader><Tab> :b#<CR>

" Delete a buffer without closing the window
nnoremap <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>

" Remember selection when indenting
vnoremap > >gv
vnoremap < <gv

" Better movement over wrapped lines
nnoremap j gj
nnoremap k gk
nnoremap gk k
nnoremap gk j

" Paste mode for terminals
nnoremap <leader>P :set invpaste paste?<CR>
vnoremap <leader>y y:call ClipboardYank()<CR>
vnoremap <leader>d d:call ClipboardYank()<CR>
nnoremap <leader>p :call ClipboardPaste()<CR>p

" Quick save
nnoremap <leader>w :w<CR>

" Shortcut for Tabularize
vnoremap <leader>t :Tabularize /
vnoremap <leader>T :Tabularize /:\zs/l0l1<CR>

" Check file for errors
nnoremap <leader>c :SyntasticCheck<CR>

" Show Quickfix window for Syntastic errors
nnoremap <leader>E :Errors<CR>

" Edit current file path
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" FZF
nnoremap <leader>t :FZF<CR>
" nnoremap <leader>t :<C-u>Denite -buffer-name=files file_rec/async<CR>

" denite.vim
nnoremap <leader>b :<C-u>Denite -buffer-name=buffer buffer<CR>
nnoremap <leader>/ :<C-u>Denite -buffer-name=line line<CR>
nnoremap <leader>a :<C-u>Denite -buffer-name=grep grep:.<CR>

" Keep search pattern at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz

" Quick search
nnoremap <leader>r :%s/<C-r><C-w>/
nnoremap <leader>R :%s/<C-r><C-a>/
vnoremap <leader>s :%s/\%V<c-r><c-w>/

" Dash
nmap <silent> K <Plug>DashSearch

" Plugin Settings
" ----------------------------------------------------------------------------

" vim-go
" let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'go vet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Syntastic
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_args=['-c', 'mishguru', '--ext', '.js,.jsx']
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_html_checkers=['']
let g:syntastic_always_populate_loc_list = 1

" denite.nvim
call denite#custom#var('file_rec', 'command', ['pt', '--follow', '--nocolor', '--nogroup', '-g:', ''])
call denite#custom#var('grep', 'command', ['pt', '--nogroup', '--nocolor', '--smart-case', '--hidden'])
call denite#custom#var('grep', 'default_opts', [])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)

" JSX
let g:jsx_ext_required = 0

" Functions
" -----------------------------------------------------------------------------

function! ClipboardYank()
  if has('mac')
    call system('pbcopy', @@)
  else
    call system('xsel -i -b', @@)
  endif
endfunction

function! ClipboardPaste()
  if has('mac')
    let @@ = system('pbpaste')
  else
    let @@ = system('xsel -b')
  endif
endfunction

function! Lint()
  let g:syntastic_javascript_eslint_args=['-c', 'stayradiated', '--ext', '.js,.jsx']
  SyntasticCheck
endfunction

" Autocommands
" -----------------------------------------------------------------------------

" Markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown setlocal tw=79

" Silverstripe
autocmd BufNewFile,BufRead *.ss set filetype=html

" Go
autocmd FileType go setlocal ts=2 sw=2 sts=2

" CSS
autocmd BufNewFile,BufRead *.css set filetype=sass
