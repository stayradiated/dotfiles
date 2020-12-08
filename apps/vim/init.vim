" Load Plugins
"
" ------------------------------------------------------------------------------

if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.config/nvim/dein')
 call dein#begin('$HOME/.config/nvim/dein')
 call dein#add('$HOME/.config/nvim/dein')

  " Dein UI
  call dein#add('wsdjeg/dein-ui.vim')

  " Themes
  call dein#add('stayradiated/vim-termorrow')
  call dein#add('reedes/vim-colors-pencil')

  " Extensions
  call dein#add('Shougo/denite.nvim')

  call dein#add('Shougo/deoplete.nvim')
  let g:deoplete#enable_at_startup = 1

  call dein#add('Shougo/neosnippet.vim')
  
  call dein#add('neoclide/denite-git')
  call dein#add('jeetsukumaran/vim-filebeagle')
  call dein#add('christoomey/vim-tmux-navigator')

  " Editing
  " call
  call dein#add('tpope/vim-repeat')
  call dein#add('arthurxavierx/vim-caser')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('godlygeek/tabular')
  call dein#add('danro/rename.vim')
  call dein#add('junegunn/fzf')
  call dein#add('junegunn/goyo.vim')
  call dein#add('wellle/tmux-complete.vim')
  call dein#add('dkarter/bullets.vim')
  call dein#add('Yggdroot/indentLine')

  call dein#add('iamcco/markdown-preview.nvim', {
    \'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
    \'build': 'sh -c "cd app & yarn install"' })

  " Languages
  call dein#add('stayradiated/vim-journal')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('fcpg/vim-waikiki')
  " call dein#add('GutenYe/json5.vim')
  " call dein#add('pangloss/vim-javascript')
  " call dein#add('neoclide/vim-jsx-improve')
  " call dein#add('cespare/vim-toml')
  " call dein#add('elzr/vim-json')
  " call dein#add('fatih/vim-go')
  " call dein#add('jxnblk/vim-mdx-js')
  " call dein#add('kchmck/vim-coffee-script')
  " call dein#add('leafgarland/typescript-vim')
  " call dein#add('mxw/vim-prolog')
  " call dein#add('vim-crystal/vim-crystal')

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Settings
" ------------------------------------------------------------------------------

" General
set completeopt-=preview " don't show preview window
set hidden               " hide when switching buffers, don't unload
set spelllang=en_nz      " spell check with New Zealand English
set title                " use filename in window title
set gdefault             " replace everything by default
set visualbell           " stop the beep
set colorcolumn=81       " for cleaner code
set showtabline=0        " hide tab line
" set synmaxcol=120      " Limit syntax highlighting
set number
" set relativenumber
set inccommand=split     " live substitution

" Backup swap files
set backup
set backupdir=$HOME/.config/nvim/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=$HOME/.config/nvim/tmp
set writebackup

" Fix for webpack-dev-server not catching file writes
" https://github.com/webpack/webpack/issues/781
set backupcopy=yes

" Infinite undo
set undofile
set undodir=$HOME/.config/nvim/undo
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
" ------------------------------------------------------------------------------

" Map Leader to space
let mapleader = " "

" Remap Tab to %
map <BS> %

" Escape terminal mode
if has('nvim')
  tnoremap <leader>e <c-\><c-n>
endif

" Comment JSX
noremap j :TCommentAs jsx<CR>

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
nnoremap <leader>Y :redir @+> \| echon fnamemodify(expand("%"), ":~:.") \| redir END<CR>

vnoremap <leader>d d:call ClipboardYank()<CR>
nnoremap <leader>p :call ClipboardPaste()<CR>p

" Quick save
nnoremap <leader>w :w<CR>

" Goyo
nnoremap <leader>g :Goyo<CR>

" Shortcut for Tabularize
vnoremap <leader>t :Tabularize /
vnoremap <leader>T :Tabularize /:\zs/l0l1<CR>

" Edit current file path
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" mkdir current file path
map <Leader>m :!mkdir <C-R>=expand("%:p:h") . "/" <CR>

" FZF
" nnoremap <leader>t :FZF<CR>
nnoremap <leader>t :<C-u>Denite -buffer-name=files file/rec<CR>

" denite.vim
nnoremap <leader>b :<C-u>Denite -buffer-name=buffer buffer<CR>
nnoremap <leader>/ :<C-u>Denite -buffer-name=line line<CR>
nnoremap <leader>A :<C-u>Denite -buffer-name=grep grep:.<CR>
nnoremap <leader>a :<C-u>Denite -buffer-name=grep -start-filter grep:::!<CR>
nnoremap <leader>k :<C-u>DeniteCursorWord grep<CR>
nnoremap <leader>[ :<C-u>Denite -resume -buffer-name=grep -cursor-pos=-1 -immediately<CR>
nnoremap <leader>] :<C-u>Denite -resume -buffer-name=grep -cursor-pos=+1 -immediately<CR>


" Keep search pattern at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz

" Quick search
nnoremap <leader>r :%s/<C-r><C-w>/
nnoremap <leader>R :%s/<C-r><C-a>/
vnoremap <leader>s :%s/\%V<c-r><c-w>/

" Insert current date
nnoremap <leader>D :r!date --iso-8601=seconds<CR>

" Plugin Settings
" ------------------------------------------------------------------------------

let g:dein#install_message_type = "none"
let g:dein#types#git#clone_depth = 1
let g:dein#notification_time = 0

" wiki
let maplocalleader = "\\"
let g:waikiki_roots = ["~/src/github.com/stayradiated/journal/public/wiki/"]
let g:waikiki_default_maps = 1

let g:indentLine_enabled = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" https://github.com/wellle/tmux-complete.vim
let g:tmuxcomplete#trigger = ''

" denite.nvim
call denite#custom#var('file/rec', 'command', ['rg', '--sort=path', '--files', '--glob', '!.git'])
call denite#custom#source('file/rec', 'sorters', ['sorter/sublime'])

call denite#custom#var('grep', 'command', ['rg', '--sort=path'])
call denite#custom#var('grep', 'default_opts', ['-i', '--glob', '!package-lock.json', '--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> p    denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q    denite#do_map('quit')
  nnoremap <silent><buffer><expr> i    denite#do_map('open_filter_buffer')
endfunction

" bullets
let g:bullets_enable_in_empty_buffers = 0

" markdown conceal
" https://github.com/plasticboy/vim-markdown#syntax-concealing
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Snippets
" ------------------------------------------------------------------------------

let g:neosnippet#snippets_directory	= '~/.config/nvim/my-snippets'
let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['typescript'] = 'typescript,javascript'
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }

imap <C-CR>    <Plug>(neosnippet_expand_or_jump)
smap <C-CR>    <Plug>(neosnippet_expand_or_jump)
xmap <C-CR>    <Plug>(neosnippet_expand_target)

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Functions
" ------------------------------------------------------------------------------

function! ClipboardYank()
  if has('mac')
    call system('pbcopy', @@)
  else
    call system('xclip -i -selection clipboard', @@)
  endif
endfunction

function! ClipboardPaste()
  if has('mac')
    let @@ = system('pbpaste')
  else
    let @@ = system('xclip -o -selection clipboard')
  endif
endfunction

" CodeMods
" ------------------------------------------------------------------------------

" `const x = require('x')` --> `import x from 'x'`
function! CodeModImport()
  %s/\v(const|let|var)\s+([A-z0-9{},: ]+)\s*\=\s*require\(['"]([^']+)['"]\)/import \2 from '\3'
endfunction

" `function (...args) {` --> `(...args) => {`
function! CodeModArrowFn()
  %s/\vfunction\s*\(([A-z,:\n ]*)\)\s*\{/(\1) => {
endfunction

" Autocommands
" ------------------------------------------------------------------------------

" Markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown setlocal tw=79

" Typescript
autocmd BufNewFile,BufRead *.tsx set filetype=typescript

" Markdown JSX
autocmd BufNewFile,BufRead *.mdx set filetype=javascript

" Go
autocmd FileType go setlocal ts=2 sw=2 sts=2

" CSS
autocmd BufNewFile,BufRead *.css set filetype=sass

" YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Journal
autocmd BufRead,BufNewFile *.txt set syntax=journal

" Goyo
autocmd! User GoyoEnter set linebreak
autocmd! User GoyoLeave set linebreak!
