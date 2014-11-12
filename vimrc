" __      __  _____   __  __   _____     _____ 
" \ \    / / |_   _| |  \/  | |  __ \   / ____|
"  \ \  / /    | |   | \  / | | |__) | | |     
"   \ \/ /     | |   | |\/| | |  _  /  | |     
"    \  /     _| |_  | |  | | | | \ \  | |____ 
"     \/     |_____| |_|  |_| |_|  \_\  \_____|                                             

" The Art of VIm {{{

" VIm is not perfect, but it is extensible. So make it perfect.
" If Vim does not do something you want it to do, add it.
" If Vim does something you do not want it to do, remove it.
" If an operation is long and hard, make it short and make it easy.
" If a manual operation can be done automatically, automate it.
" If Vim is ugly, make it pretty.
" Make sure none of the above interrupts your flow

" The Art of VIm }}}

" Global Variables {{{

if !exists('g:is_startup') " Determine if we just started up vim
    let g:is_startup = 1
else
    let g:is_startup = 0
endif

if g:is_startup

    if has('win32') || has('win64')
        let g:is_win = 1
        let g:is_nix = 0
    elseif has('unix')
        let g:is_win = 0
        let g:is_nix = 1
    endif

    let g:is_gui = has("gui_running")
    let g:is_terminal = !has("gui_running")
    let g:hostname = substitute(system('hostname'), '\n', '', '')
    let g:rootmarkers = ['hello', 'hi', 'README'] " Markers used to find project directory
endif

" Global Veriables }}}

" Plugin Installs{{{

" bye bye, Vi, and nice knowing ya, vanilla VIm
set nocompatible
                                              
"  START OF NEOBUNDLE
set runtimepath+=~/.vim/bundle/neobundle.vim/
set runtimepath+=~/.vim/bundle/*
let g:docpaths = split(expand("~/.vim/bundle/*/doc/"),'\n')
for docstr in g:docpaths
execute "set runtimepath+=".docstr
endfor
set runtimepath+=$VIM/bundle/neobundle.vim/
"let path='~/vimfiles/bundle'

call neobundle#begin(expand('~/.vim/bundle/'))

" Core Plugins {{{
NeoBundleFetch 'Shougo/neobundle.vim' " Let NeoBundle update NeoBundle
NeoBundleFetch 'dbakker/vim-projectroot'
NeoBundleFetch 'rking/ag.vim'    " AG.vim - interface to ag.exe,  grep/ack replacement
NeoBundleFetch 'kien/ctrlp.vim'    " CtrlP - Fuzzy File Search
NeoBundleFetch 'gtags.vim'    " Vim Support for GNU Global
NeoBundleFetch 'Shougo/unite.vim'
"}}}

" Color Scheme Plugins {{{
NeoBundleFetch 'altercation/vim-colors-solarized'    " Solarized - a Solid Color Scheme
NeoBundleFetch '29decibel/codeschool-vim-theme'
NeoBundleFetch 'jonathanfilip/vim-lucius'
NeoBundleFetch 'vim-scripts/darktango.vim'
NeoBundleFetch 'djjcast/mirodark'
NeoBundleFetch 'sjl/badwolf'
NeoBundleFetch 'ciaranm/inkpot'
NeoBundleFetch 'w0ng/vim-hybrid'
NeoBundleFetch 'hickop/vim-hickop-colors'
"}}}

" Functional Plugins {{{

" Plugin 'Shougo/neocomplcache.vim'    " neocomplcache - Autocompletion system for vim 
"NeoBundleFetch 'majutsushi/tagbar'    " TagBar - a pleasant code outline for the current buffer
NeoBundleFetch 'Lokaltog/vim-easymotion'
NeoBundleFetch 'jeffkreeftmeijer/vim-numbertoggle'
NeoBundleFetch 'mhinz/vim-startify'
"Plugin 'tpope/vim-surround'
"Plugin 'bling/vim-airline'
"Plugin 'linediff
"Plugin 'c.vim' or 'snipMate.vim'
NeoBundleFetch 'whatyouhide/vim-gotham'    " dark color scheme
NeoBundleFetch 'tpope/vim-unimpaired'    " each [x & ]x mappings
NeoBundleFetch 'godlygeek/tabular'
"NeoBundleFetch 'AndrewRadev/splitjoin.vim'
"NeoBundleFetch 'justinmk/vim-sneak'

" Functional Plugins }}}

" Unite Plugins {{{

"NeoBundleFetch 'Shougo/vimproc.vim'
NeoBundleFetch 'Shougo/neomru.vim'
NeoBundleFetch 'Shougo/unite-outline'
NeoBundleFetch 'ujihisa/unite-colorscheme'
NeoBundleFetch 'tacroe/unite-mark'
NeoBundleFetch 'hewes/unite-gtags'
NeoBundleFetch 'sgur/unite-qf'  " quickfix window source
NeoBundleFetch 'thinca/vim-unite-history' " Unite display of command and search history

" Unite Plugins }}}

call neobundle#end()

filetype plugin indent on

" **END OF NEOBUNDLE**


"}}}

"Plugin Options {{{

" Netrw Options {{{
let g:netrw_liststyle=0
" Netrw Options }}}

" Solarized Options {{{

let g:solarized_italic=0
colorscheme solarized

" Solarized Options }}}

" CtrlP Options {{{

"let g:ctrlp_map = '<C-p>'
"let g:ctrlp_cmd = 'CtrlPMixed'
"let g:ctrlp_user_command = {
"\}
"ADD TEXT SEARCH, LOOK FOR CTAGS SEARCH?
"let g:ctrlp_extensions = ['mixed', 'quickfix', 'undo', 'line', 'changes', 'cmdline', 'menu']
let g:ctrlp_max_height = 20
let g:ctrlp_mruf_exclude = '/tmp.*\|/usr/share.*\|.*bundle.*\|.*\.git'
"let g:ctrlp_switch_buffer = 'et'

"otherwise ctrlp will only lookat the first 15k files:
let g:ctrlp_max_files=0
"let g:ctrlp_by_filename = 0

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|s|i|o|lst|pbi|cout|icf)$',
  \ }

" CtrlP Options }}}

" NeoComplCache {{{
"    _  _             ___                    _   ___            _         
"   | \| | ___  ___  / __| ___  _ __   _ __ | | / __| __ _  __ | |_   ___ 
"   | .` |/ -_)/ _ \| (__ / _ \| '  \ | '_ \| || (__ / _` |/ _|| ' \ / -_)
"   |_|\_|\___|\___/ \___|\___/|_|_|_|| .__/|_| \___|\__,_|\__||_||_|\___|
"                                     |_|                                 
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 0 " 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" NeoComplCache }}}

" Startify {{{
"    ___  _               _    _   __       
"   / __|| |_  __ _  _ _ | |_ (_) / _| _  _ 
"   \__ \|  _|/ _` || '_||  _|| ||  _|| || |
"   |___/ \__|\__,_||_|   \__||_||_|   \_, |
"                                      |__/ 

let g:startify_list_order = [
      \ ['   Recently Accessed:'],
      \ 'files',
      \ ['   Sessions:'],
      \ 'sessions',
      \ ]

" should add more ascii art, and choose header by random number, also fortune
let g:startify_custom_header = [
\"                                                                       ",
\"                                     (@@@)     (@@@@@)                 ",
\"                               (@@)     (@@@@@@@)        (@@@@@@@)     ",
\"                         (@@@@@@@)   (@@@@@)       (@@@@@@@@@@@)       ",
\"                    (@@@)     (@@@@@@@)   (@@@@@@)             (@@@)   ",
\"               (@@@@@@)    (@@@@@@)     (@@@@@@)    (@@@)              ",
\"           (@@@)  (@@@@)           (@@)                                ",
\"        (@@)              (@@@)                                        ",
\"       .-.                                                             ",
\"       ] [    .-.      _    .-----.                                    ",
\"     .'   ''''   '''''' ''''| .--`                                     ",
\"    (:--:--:--:--:--:--:--:-| [___    .------------------------.   .------------------------.   .------------------------.   .------------------------.   .------------------------.   .------------------------.   .------------------------.       ",
\"     | JR  :  :  :  :  :  : [_9_] |'='|.----------------------.|'='|.----------------------.|'='|.----------------------.|'='|.----------------------.|'='|.----------------------.|'='|.----------------------.|'='|.----------------------.|       ",
\"    /|.___________________________|___|'--.___.--.___.--.___.-'|___|'--.___.--.___.--.___.-'|___|'--.___.--.___.--.___.-'|___|'--.___.--.___.--.___.-'|___|'--.___.--.___.--.___.-'|___|'--.___.--.___.--.___.-'|___|'--.___.--.___.--.___.-'|       ",
\"   / ||_.--.______.--.______.--._ |---\\'--\\-.-/==\\-.-/==\\-.-/-'/---\\'--\\-.-/==\\-.-/==\\-.-/-'/---\\'--\\-.-/==\\-.-/==\\-.-/-'/---\\'--\\-.-/==\\-.-/==\\-.-/-'/---\\'--\\-.-/==\\-.-/==\\-.-/-'/---\\'--\\-.-/==\\-.-/==\\-.-/-'/---\\'--\\-.-/==\\-.-/==\\-.-/-'/--     ",
\"  /__;^=(==)======(==)======(==)=^~^^^ ^^^^(-)^^^^(-)^^^^(-)^^^ ^^^ ^^^^(-)^^^^(-)^^^^(-)^^^ ^^^ ^^^^(-)^^^^(-)^^^^(-)^^^ ^^^ ^^^^(-)^^^^(-)^^^^(-)^^^ ^^^ ^^^^(-)^^^^(-)^^^^(-)^^^ ^^^ ^^^^(-)^^^^(-)^^^^(-)^^^ ^^^ ^^^^(-)^^^^(-)^^^^(-)^^^        ",
\"~~~^~~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~   ",
\"",
\"",
\"",
\"",
\]

" Startify }}}
                                                                    
" Plugin Options }}}

" Set Options {{{
"TODO : unncessary? set runtimepath^=~/.vim/bundle/ctrlp.vim
" TODO slowly remove/replace this
source $VIMRUNTIME/mswin.vim
"TODO
behave mswin
set autoread                         " Automatically reload a file when you select the buffer, if something else has modified it
set whichwrap+=<,>,[,]               " Allow curser to wrap around to the next or previous line
set backspace=indent,eol,start       " Allow backspacing over autoindent, line breaks, and past beggining of insert action
set cmdheight=2                      " Less 'press <Enter> to continue'
set confirm                          " Bring up a dialog asking if you want to save changes when actions which leave the buffer
set cursorline                       " Highlight cursor line
set expandtab                        " Spaces instead of tabs
set foldlevelstart=99                " Start all the way folded
set foldmethod=marker                " By default, set the fold method to markers, it will be overwritten by autocmds
set history=500                      " number of commands to keep in history
set ignorecase                       " Ignore make lowercase seaches case-insensitive
set incsearch                        " Automatically jump to any results whil typing in search
set laststatus=2                     " Always display the status line
set nobackup                         " Do not make a backup when overwriting a file
set nowritebackup                    " Do not write a backup when overwriting a file
set number                           " Display line numbers
set omnifunc=syntaxcomplete#Complete " Turn completion on
set ruler                            " Display cursor position in the bottom right
set scrolloff=10                     " Dislay 10 line above and below the cursor
set shiftwidth=4                     " A tab is 4 spaces
set sidescrolloff=10                 " Dislay 10 line to the left and right of the cursor
set smartcase                        " Make searches with any uppercase letters be case-sensitive
set smarttab                         " Treat 4 spaces as if it was a tab
set softtabstop=4                    " 4 spaces when i hit tab
set tabstop=4                        " Interpret a tab as 4 spaces
set tags=/tags;./tags;/,tags;        " Is this optimal? maybe direct project root first, than tag back relay
set visualbell                       " Instead of beeping, induce seizures by screen flashing

"set background=dark " will modify backgrounds, which may have different color for dark and light
"set nohidden " When I close a tab, remove the buffer
"set noswapfile "do not make swapfiles, this would be nice, except it is also used to warn users of opening a file up twice in different windows
"set shellslash "TODO

compiler gcc "use gcc for building and quickfixing errors
hi CursorLine term=none cterm=none ctermbg=3      
filetype plugin indent on " Turn on filetype specific indenting
syntax enable " Turn on syntax coloring

call matchadd('ColorColumn', '\%81v', 100)
 
"}}}

" Functions {{{

" Fold Functions{{{
"set foldtext=CustomFoldText()
fu! CustomFoldText()
    get first non-blank line
    fs = v:foldstart
    getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)

    fs > v:foldend
    line = getline(v:foldstart)

    line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
endif

let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
let foldSize = 1 + v:foldend - v:foldstart
let foldSizeStr = " " . foldSize . " lines "
let foldLevelStr = repeat("+--", v:foldlevel)
let lineCount = line("$")
let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
 endf

"}}}

" Key Functions {{{
"not functional yet
function! GtagsRefSearch()
    :let wordUnderCursor = expand("<cword>")
    :execute "Gtags -r " . wordUnderCursor
endfunction

function! BuildCtags(dir)
    execute 'cd' fnameescape(a:dir)

    if has("win32")
        !ctags.exe -R --exclude=builds .
    elseif has ("unix")
        !ctags -R --exclude=debian --exclude=builds --exclude=build .
    endif
endfunction

function! BuildGtags(dir)
    execute 'cd' fnameescape(a:dir)
    :!gtags
endfunction

function! RunAgOnWordUnderCursor(dir)
    let wordUnderCursor = expand("<cword>")
    call RunAg(wordUnderCursor, a:dir)
endfunction

function! RunAgOnInput(dir)
    let searchString = input("Ag Search For: ")
    call RunAg(searchString, a:dir)
endfunction

function! RunAg(text, dir)
  let g:AgIgnoreString = " --ignore-dir builds --ignore-dir utility --ignore *.patch --ignore tags --ignore oldtags --ignore *TMP --ignore *.s19 --ignore *.bin --ignore *.exe --ignore *.ewp --ignore *.hex --ignore *.htm --ignore *.html --ignore *.vcproj* --ignore *.make --ignore *.srec --ignore *.pdf --ignore-dir documentation --ignore *.bat --ignore *.tex --ignore *.css --ignore README --ignore *.shtml "
    "let searchString =  "Ag! -S --stats " . g:AgIgnoreString . a:text . " " . a:dir
    let searchString =  "Ag! -S --stats --ignore builds --ignore utility --ignore *.patch --ignore tags --ignore oldtags --ignore TMP " . a:text . " " . a:dir
    let searchString =  "Ag! -S --stats  --ignore-dir builds --ignore-dir utility --ignore *.patch --ignore tags --ignore oldtags --ignore *TMP --ignore *.s19 --ignore *.bin --ignore *.exe --ignore *.ewp --ignore *.hex --ignore *.htm --ignore *.html --ignore *.vcproj* --ignore *.make --ignore *.srec --ignore *.pdf --ignore-dir documentation --ignore *.bat --ignore *.tex --ignore *.css --ignore README --ignore *.shtml " . a:text . " " . a:dir
    execute searchString
endfunction

function! BuildHelpTags(doclocations)
for docloc in a:doclocations 
    :execute "helptag " . docloc
endfor
endfunction


"given a file called build.log, parse build errors and open in a quickfix
function! ParseBuildLog(logfile)
    "find redirects
    set efm=%.%#text\=\'%f(%l)\ :\ %m\]
    "find normal error outputs
    set efm+=%f(%l)\ :\ %m
    "skip all other messages
    set efm+=%-G%.%#
    "run the build error parse over the log
    execute 'cgetfile' fnameescape(a:logfile).'\build.log'
    "open up the quickfix
    :cwindow
endfunction

"}}}

" Utility Functions {{{

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

function! SetRoot()
    let g:project_root_sys = ProjectRootGuess() 
    let g:project_root_fs = substitute(g:project_root_sys, '\', '/', "g")
    let g:project_root_bs = substitute(g:project_root_sys, '/', '\', "g")
    let g:project_root_dbs = substitute(g:project_root_fs, '/', '\\\\', "g")
    let g:current_loc_sys = escape(expand("%:p:h"), ' ')
    let g:current_loc_fs = substitute(g:current_loc_sys, '\', '/', "g")
    "execute "chdir ".escape(expand("%:p:h"), ' ')
    execute "chdir ".escape(expand(g:project_root_sys), ' ')
endfunction

function! GetRoot()
    echo g:project_root_sys
    echo g:project_root_fs
    echo g:project_root_bs
    echo g:project_root_dbs
    echo g:current_loc_sys
    echo g:current_loc_fs
endfunction
"}}}
"}}}

" Key Mappings {{{


"fuzzy escapes to normal mode
" add ctrl-u/d?
"nnoremap <C-n> <C-d>
" Insert Mode Mappings {{{
inoremap <silent> <C-L> <Right>
inoremap <silent> <C-H> <Left>
inoremap <silent> <C-K> <Up>
inoremap <silent> <C-J> <Down>
" }}}

" Normal Mode Mappings {{{
nnoremap <silent> K <C-U>
nnoremap <silent> J <C-D>
nnoremap j gj
nnoremap k gk


"Useless keys to really Useful keys
"set the old leader up for something useful, maybe bidirectional character jump?
"inoremap ,, <Esc>
nmap , <Plug>(easymotion-f)
nnoremap \ @q 

nmap <leader>f <Plug>(easymotion-f)
nmap <leader>F <Plug>(easymotion-F)

map <C-;> :bnext<CR>
map <C-'> :bprev<CR>
map <C-,> :tabn<CR>
map <C-.> :tabp<CR>


map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"C-\ will open the definition in a new tab
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"C-] will open the definition in a new split
" }}}

" Leader Key Mappings {{{
let mapleader = " "

nmap <silent> <leader>/ :nohlsearch<CR>
nmap <silent> <leader>bv :tabnew $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>

"perhaps put all the misc unite ones under <leader>u{logical char}

" Quick Builds {{{
if has("win32")
    nmap <leader>bc <esc>:call BuildCtags(g:project_root_bs)<CR>
    nmap <leader>bg <esc>:call BuildGtags(g:project_root_bs)<CR>
    nmap <leader>bi <esc>:call ParseBuildLog(g:project_root_bs)<CR>

else
    nmap <leader>bc <esc>:call BuildCtags(g:project_root_fs)<CR>
    nmap <leader>bg <esc>:call BuildGtags(g:project_root_fs)<CR>
endif
nmap <leader>bn <esc>:Unite -buffer-name=neobundle -no-cursor-line -log neobundle/update<CR>
nmap <leader>bh <esc>:call BuildHelpTags(g:docpaths)<CR>
"}}}

" Ag Mappings {{{
nmap <silent> <leader>ac <esc>:call RunAgOnWordUnderCursor(g:project_root_sys)<CR>
nmap <silent> <leader>Ac <esc>:call RunAgOnWordUnderCursor(g:current_loc_fs)<CR>
nmap <silent> <leader>ai <esc>:call RunAgOnInput(g:project_root_sys)<CR>
" Ag Mappings}}}

" Gtags Mappings {{{
nmap <silent> <leader>Ai <esc>:call RunAgOnInput(g:current_loc_fs)<CR>
nmap <silent> <leader>an <esc>:call RunAgOnInput(g:docs_path)<CR>

" }}}
nmap <silent> <leader>gC <esc>:call GtagsRefSearch()<CR>
"TODO COPIED< DOUBLE CHECK
nmap <silent> <leader>gn <esc>:cn<CR>
nmap <silent> <leader>gp <esc>:cp<CR>
nmap <silent> <leader>gl <esc>:cl<CR>
" }}}

" Paste/Replace Mappings {{{
nnoremap <leader>x viw"ap
nnoremap <leader>z V"zp
" }}}

" Quick Comments/Ifdef {{{
nnoremap <A-/> :s/^/\/\//<CR>
nnoremap <A-?> :s/^\/\///<CR>
xnoremap <A-/> :s/^/\/\//<CR>
xnoremap <A-?> :s/^\/\///<CR>
"xnoremap <C-#> :'<,`>
" }}}
"
" Quick Semicolon {{{
" "TODO make versatile
nnoremap <leader>; <esc>A;<esc>j 
" }}}

" Quick Tabs {{{
nmap <silent> <leader>tn <esc>:tabnew<CR>
nmap <silent> <leader>Q <esc>:tabclose<CR>
"nmap <silent> <leader>tl <esc>:tabnext<CR>
"nmap <silent> <leader>th <esc>:tabprev<CR>
"}}}

" Quick Tags iteration {{{
nmap <silent> <leader>n <esc>:tn<CR>
nmap <leader>p <esc>:tp<CR>
"}}}

nmap q<leader> <nop>
nmap <leader> <nop>

" Quick Splits {{{
nmap <silent> <leader>vn <esc>:vnew<CR>
nmap <silent> <leader>vs <esc>:vsplit<CR>
nmap <silent> <leader>hn <esc>:new<CR>
nmap <silent> <leader>hs <esc>:split<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-l> :wincmd l<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
"nnoremap <silent> <c-K> :wincmd K<CR>                                                                                                                       
"nnoremap <silent> <c-J> :wincmd J<CR>                                                                                                                       
"nnoremap <silent> <c-H> :wincmd H<CR>                                                                                                                       
"nnoremap <silent> <c-L> :wincmd L<CR>
"}}}

" Personal TODO {{{
nnoremap <leader>df <esc>/TODO<CR>
nnoremap <leader>dF <esc>/TODO<CR>N
nnoremap <leader>da <esc>a//TODO:
nnoremap <leader>dr <esc>k/\/\/TODO:<CR><esc>D
"}}}

call unite#custom#source('file_rec/async','sorters','sorter_rank')
call unite#filters#matcher_default#use(['matcher_fuzzy']) " Use fuzzy selection in Unite Insert Mode
call unite#filters#sorter_default#use(['sorter_rank']) " Sort Fuzzy selection, by fuzziness, not alphabetical

" Quick Explorer {{{
function! OpenExplorerHere()
    if !empty(g:current_loc_fs)
        execute 'Unite' '-start-insert' 'file' '-path=' . g:current_loc_fs
    else
        execute 'Unite' 'file'
    endif
endfunction
nnoremap <leader>e :call OpenExplorerHere()<CR>

function! OpenExplorerProject()
    if !empty(g:project_root_fs)
        execute 'Unite' '-start-insert' 'file' '-path=' . g:project_root_fs
    else
        execute 'Unite' 'file'
    endif
endfunction
nnoremap <leader>E :call OpenExplorerProject()<CR>
" }}}

" Quick Fuzzy {{{
function! OpenFuzzySearch()
    if !empty(g:project_root_fs)
        execute ':CtrlP ' . g:project_root_sys
    else
        execute ':CtrlP '
    endif
endfunction
nnoremap <leader>r :call OpenFuzzySearch()<CR>


function! OpenFuzzierSearch()
    if !empty(g:project_root_fs)
        execute 'Unite' '-start-insert file_rec' '-path=' . g:project_root_fs
    else
        execute 'Unite' '-start-insert file_rec' '-path=' . g:project_root_fs
        "execute 'Unite' '-start-insert file_rec'
    endif
endfunction
nnoremap <leader>R :call OpenFuzzierSearch()<CR>
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', join([
    \ '\.\(git\|svn\|i|o|ewp|swp|exe|so|dll|s|lst|pbi|cout|icf|html\)$', 
    \ 'builds\/',
    \ 'utility\/',
    \ ], 
    \ '\|'))
" }}}

" Leader Key }}}

" Unite Key Mappings {{{
let g:unite_force_overwrite_statusline = 0
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '-S --stats --ignore builds --ignore utility --ignore *.patch --ignore tags --ignore oldtags --ignore TMP'
    let g:unite_source_grep_recursive_opt = ''
endif

" Grepping
"nnoremap <leader>g :Unite -no-split grep<cr>
"TOD nnoremap united :Unite -no-split grep:.:-s:\(TODO\|FIXME\)<cr>


let g:unite_source_history_yank_enable = 1 " Keep track of yanks for 'Unite yank'

" Only display the filename (filepath tail) in the buffer screen
  call unite#custom#source(
        \ 'buffer', 'matchers',
        \ ['converter_tail', 'matcher_default'])
  call unite#custom#source(
        \ 'buffer', 'converters',
        \ ['converter_file_directory'])

"TODO map to a unite key (maybe alt or keep the key as <leader>g)?
nnoremap <silent> <A-u> :<C-u>UniteClose<CR>
nnoremap <silent> <leader>j :<C-u>Unite buffer -start-insert <CR>
nnoremap <silent> <leader>J :<C-u>Unite buffer_tab -start-insert <CR>
nnoremap <silent> <leader>k :<C-u>Unite tab<CR>
nnoremap <silent> <leader>l :<C-u>Unite line -start-insert <CR>
nnoremap <silent> <leader>h :<C-u>Unite file_mru -start-insert -buffer-name=History<CR>
nnoremap <silent> <leader>ub :<C-u>Unite bookmark -toggle -here -buffer-name=Bookmarks <CR>
nnoremap <silent> <leader>uc :<C-u>Unite colorscheme -buffer-name=Colorschemes<CR>
nnoremap <silent> <leader>m :<C-u>Unite jump -buffer-name=Marks<CR>
nnoremap <silent> <leader>y :<C-u>Unite history/yank -buffer-name=Copies<CR>
nnoremap <leader>gc :Unite -immediately -no-quit -keep-focus -winheight=15 gtags/context<CR>
nnoremap <leader>gr :Unite -immediately -no-quit -keep-focus -winheight=25 gtags/ref<CR>
nnoremap <leader>gs :Unite -immediately -no-quit -keep-focus -winheight=15 gtags/completion<CR>
nnoremap <leader>gi :Unite -immediately -no-quit -keep-focus -winheight=15 gtags/grep<CR>
nnoremap <leader>gd :Unite -immediately -winheight=17 -buffer-name=Definition gtags/def<CR>

let g:unite_source_outline_ctags_program = 'C:\\Vim\\ctags.exe'
nnoremap <silent> <leader>o :<C-u>Unite -start-insert -auto-preview outline  -buffer-name=Outline<CR>
"use c-n & c-p for now, alt, ctrl, and shift are all no good for this
"inoremap <buffer> <A-j> <Plug>(unite_select_next_line)
"inoremap <buffer> <A-k> <Plug>(unite_select_previous_line)

" Unite Key Mappings }}}

nnoremap <silent> <leader>q :q<CR>
"nnoremap <silent> <leader>w :w<CR> " Machine specific so added later on

"}}}

"  Machine Specific {{{                                  

if g:is_win " Windows Configuration

    set fileformat=dos " Will set the carriage returns to windows/style when saving/editing a file
    set fileformats=dos,unix " WIll try unix and windows style EOL when opening a file

elseif g:is_nix " Linux Configuration

    set fileformat=unix " Will set the carriage returns to windows/style when saving/editing a file
    set fileformats=dos,unix " WIll try unix and windows style EOL when opening a file

endif

if g:is_gui

    set guioptions-=T  " Remove toolbar(icon bar)
    set guioptions-=m  " Remove menu
    set guioptions-=r  " Remove right-hand scroll bar
    set guioptions-=L  " Remove left-hand scroll bar

    if g:is_nix " Linux Configuration

        set guifont="ProggyCleanTT 12"
        set lines=999 columns=999 " Maximize window
        "nmap <leader>w :w ++ff=unix<CR>
        nmap <leader>w :w<CR>

    elseif g:is_win " Windows Configuration

        set guifont=ProggyCleanTT:h11:cANSI
        "TODO try true fullscreen, like a vn
        set lines=71 columns=260 " For a 1080p screen
        nmap <leader>w :w<CR>

    endif

endif
"}}}

" Startup Only {{{

if g:is_startup
    "echo '☃ Welcome Back: ' . g:hostname
    "execute "Unite bookmark"
endif
"if hostname == "PC1"
"set lines=71 columns=260
"elseif hostname == "pc2"
"endif
"source hostname . "vim"

" }}}

" AutoCmds {{{
autocmd BufEnter * :call SetRoot()
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType c,c++ setlocal foldmethod=syntax
autocmd FileType text setlocal foldmethod=indent


  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

"autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ') " Automatically cd into the directory that the file is in


"}}}

" Misc Unicode Characters {{{
" ⎈✺ ☔❂
" }}}

" Vim Notes {{{
" '<,'>sort  -> sort selected lines

" Vim Notes }}}
