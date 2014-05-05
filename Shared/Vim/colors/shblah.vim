" ┏━┓╻ ╻┏┓ ╻  ┏━┓╻ ╻   ╻ ╻╻┏┳┓
" ┗━┓┣━┫┣┻┓┃  ┣━┫┣━┫   ┃┏┛┃┃┃┃
" ┗━┛╹ ╹┗━┛┗━╸╹ ╹╹ ╹ ╹ ┗┛ ╹╹ ╹
"                           -- by z3bra
" =====================================
"
" A 16 colors scheme that use your terminal colors

set background=dark
if version > 580
    highlight clear
    if exists("g:syntax_on")
        syntax reset
    endif
endif
let g:colors_name="shblah"

" Actual colours and styles.
highlight ColorColumn  term=NONE cterm=NONE ctermfg=NONE ctermbg=3
highlight Comment      term=NONE cterm=bold ctermfg=0    ctermbg=NONE
highlight Constant     term=NONE cterm=bold ctermfg=2    ctermbg=NONE
highlight Cursor       term=NONE cterm=bold ctermfg=3    ctermbg=NONE
highlight CursorLine   term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
highlight DiffAdd      term=NONE cterm=bold ctermfg=2    ctermbg=NONE
highlight DiffChange   term=NONE cterm=bold ctermfg=3    ctermbg=NONE
highlight DiffDelete   term=NONE cterm=bold ctermfg=1    ctermbg=NONE
highlight FoldColumn   term=NONE cterm=bold ctermfg=0    ctermbg=NONE
highlight Folded       term=NONE cterm=bold ctermfg=0    ctermbg=NONE
highlight Function     term=NONE cterm=bold ctermfg=7    ctermbg=NONE
highlight Identifier   term=NONE cterm=bold ctermfg=1    ctermbg=NONE
highlight IncSearch    term=NONE cterm=bold ctermfg=5    ctermbg=5
highlight NonText      term=NONE cterm=bold ctermfg=0    ctermbg=NONE
highlight Normal       term=NONE cterm=NONE ctermfg=7    ctermbg=NONE
highlight Pmenu        term=NONE cterm=NONE ctermfg=0    ctermbg=7
highlight PreProc      term=NONE cterm=bold ctermfg=3    ctermbg=NONE
highlight Search       term=NONE cterm=bold ctermfg=7    ctermbg=5
highlight Special      term=NONE cterm=bold ctermfg=2    ctermbg=NONE
highlight SpecialKey   term=NONE cterm=NONE ctermfg=2    ctermbg=NONE
highlight Statement    term=NONE cterm=bold ctermfg=7    ctermbg=NONE
highlight StatusLine   term=NONE cterm=bold ctermfg=0    ctermbg=NONE
" highlight StatusLineNC term=NONE cterm=bold ctermfg=0    ctermbg=NONE
highlight String       term=NONE cterm=NONE ctermfg=1    ctermbg=NONE
highlight TabLineSel   term=NONE cterm=bold ctermfg=7    ctermbg=NONE
highlight Todo         term=NONE cterm=bold ctermfg=7    ctermbg=1
highlight Type         term=NONE cterm=NONE ctermfg=3    ctermbg=NONE
highlight VertSplit    term=NONE cterm=bold ctermfg=0    ctermbg=NONE
highlight Visual       term=NONE cterm=bold ctermfg=7    ctermbg=3

" General highlighting group links.
highlight! link diffAdded       DiffAdd
highlight! link diffRemoved     DiffDelete
highlight! link diffChanged     DiffChange
highlight! link StatusLineNC    StatusLine
highlight! link Title           Normal
highlight! link LineNr          NonText
highlight! link TabLine         StatusLineNC
highlight! link TabLineFill     StatusLineNC
highlight! link VimHiGroup      VimGroup

" Test the actual colorscheme
syn match Comment      "\"__Comment.*"
syn match Constant     "\"__Constant.*"
syn match Cursor       "\"__Cursor.*"
syn match CursorLine   "\"__CursorLine.*"
syn match DiffAdd      "\"__DiffAdd.*"
syn match DiffChange   "\"__DiffChange.*"
syn match DiffDelete   "\"__DiffDelete.*"
syn match Folded       "\"__Folded.*"
syn match Function     "\"__Function.*"
syn match Identifier   "\"__Identifier.*"
syn match IncSearch    "\"__IncSearch.*"
syn match NonText      "\"__NonText.*"
syn match Normal       "\"__Normal.*"
syn match Pmenu        "\"__Pmenu.*"
syn match PreProc      "\"__PreProc.*"
syn match Search       "\"__Search.*"
syn match Special      "\"__Special.*"
syn match SpecialKey   "\"__SpecialKey.*"
syn match Statement    "\"__Statement.*"
syn match StatusLine   "\"__StatusLine.*"
syn match StatusLineNC "\"__StatusLineNC.*"
syn match String       "\"__String.*"
syn match Todo         "\"__Todo.*"
syn match Type         "\"__Type.*"
syn match VertSplit    "\"__VertSplit.*"
syn match Visual       "\"__Visual.*"

"__Comment              /* this is a comment */
"__Constant             var = SHBLAH
"__Cursor               char under the cursor?
"__CursorLine           Line where the cursor is
"__DiffAdd              +line added from file.orig
"__DiffChange           changed from file.org
"__DiffDelete           -line removed from file.orig
"__Folded               +--- 1 line : Folded line ---
"__Function             function sblah()
"__Identifier           Never ran into that actually...
"__IncSearch            Next search term
"__NonText              This is not a text, move on
"__Normal               Typical text goes like this
"__Pmenu                Currently selected menu item
"__PreProc              #define SHBLAH true
"__Search               This is what you're searching for
"__Special              true false NULL SIGTERM
"__SpecialKey           Never ran into that either
"__Statement            if else return for switch
"__StatusLine           Statusline of current windows
"__StatusLineNC         Statusline of other windows
"__String               "Hello, World!"
"__Todo                 TODO: remove todos from source
"__Type                 int float char void unsigned uint32_t
"__VertSplit            :vsplit will only show ' | '
"__Visual               Selected text looks like this
