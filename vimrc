" __      __  _____   __  __   _____     _____
" \ \    / / |_   _| |  \/  | |  __ \   / ____|
"  \ \  / /    | |   | \  / | | |__) | | |
"   \ \/ /     | |   | |\/| | |  _  /  | |
"    \  /     _| |_  | |  | | | | \ \  | |____
"     \/     |_____| |_|  |_| |_|  \_\  \_____|

" Global Variables {{{

"TODO:autocmds this
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

" Plugin Installs {{{

" bye bye, Vi, and nice knowing ya, vanilla VIm
set nocompatible

" NeoBundle Start {{{
set runtimepath+=~/.vim/bundle/neobundle.vim/
set runtimepath+=~/.vim/bundle/*
let g:docpaths = split(expand("~/.vim/bundle/*/doc/"),'\n')
for docstr in g:docpaths
execute "set runtimepath+=".docstr
endfor
set runtimepath+=$VIM/bundle/neobundle.vim/
"let path='~/vimfiles/bundle'

call neobundle#begin(expand('~/.vim/bundle/'))
" NeoBundle Start }}}

" Core Plugins {{{
NeoBundleFetch 'Shougo/neobundle.vim' " Let NeoBundle update NeoBundle
NeoBundleFetch 'dbakker/vim-projectroot'
NeoBundleFetch 'rking/ag.vim'    " AG.vim - interface to ag.exe,  grep/ack replacement
NeoBundleFetch 'kien/ctrlp.vim'    " CtrlP - Fuzzy File Search
NeoBundleFetch 'gtags.vim'    " Vim Support for GNU Global
NeoBundleFetch 'Shougo/unite.vim'
"NeoBundleFetch 'Shougo/neocomplcache.vim'    " neocomplcache - Autocompletion system for vim
"NeoBundleFetch 'jceb/vim-orgmode'
NeoBundleFetch 'bufkill.vim'
"NeoBundleFetch 'mtth/scratch.vim'  " gs to toggle a scratch buffer
NeoBundleFetch 'Raimondi/delimitMate'  " automatically end braces
NeoBundleFetch 'vimoutliner/vimoutliner'
NeoBundleFetch 'jaxbot/semantic-highlight.vim'
"NeoBundleFetch 'vim-scripts/SemanticHL' "jaxbot/semantic-highlight.vim
"NeoBundleFetch 'Shougo/vimfiler.vim'
"NeoBundleFetch 'TaskList.vim' " puts todos in code, in a viewable list
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
"NeoBundleFetch 'junegunn/seoul256.vim'
NeoBundleFetch 'whatyouhide/vim-gotham'    " dark color scheme
"}}}

" Functional Plugins {{{

" Visual Plugins {{{
NeoBundleFetch 'jeffkreeftmeijer/vim-numbertoggle'
NeoBundleFetch 'mhinz/vim-startify'
NeoBundleFetch 'sjl/gundo.vim'
NeoBundleFetch 'vim-scripts/DirDiff.vim'
NeoBundleFetch 'Shougo/vinarise.vim'
NeoBundleFetch 'osyo-manga/vim-brightest'
"NeoBundleFetch 'nathanaelkane/vim-indent-guides'
 
"NeoBundleFetch 'scrooloose/syntastic' " show build errors visual in the file
"NeoBundleFetch 'Lokaltog/powerline' "pretty status bars
"NeoBundleFetch 'majutsushi/tagbar'    " TagBar - a pleasant code outline for the current buffer
"Plugin 'linediff
"Plugin 'bling/vim-airline'
" Visual Plugins }}}
"
" Movement Plugins {{{
"NeoBundleFetch 'Lokaltog/vim-easymotion'
NeoBundleFetch 'tpope/vim-unimpaired'    " each [x & ]x mappings
"NeoBundleFetch 'justinmk/vim-sneak'
""'wellle/targets.vim'
" Movement Plugins }}}
"
" Formatting {{{
NeoBundleFetch 'junegunn/vim-easy-align'
NeoBundleFetch 'tpope/vim-endwise'
"NeoBundleFetch 'AndrewRadev/splitjoin.vim'
NeoBundleFetch 'tpope/vim-surround'
NeoBundle 'msanders/snipmate.vim'
" Formatting }}}

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
NeoBundleFetch 'kien/rainbow_parentheses.vim'

" Unite Plugins }}}

" NeoBundle End {{{
call neobundle#end()
filetype plugin indent on
" NeoBundle End }}}

" Plugin Installs }}}

" Plugin Options {{{

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
  \ 'file': '\v\.(exe|so|dll|s|i|o|lst|hex|s19|pbi|cout|icf|srec|bin|html|htm|out|)$',
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

let g:startify_files_number = 25
let g:startify_list_order = [
      \ ['   Recently Accessed:'],
      \ 'files',
      \ ['   Sessions:'],
      \ 'sessions',
      \ ]

" should add more ascii art, and choose header by random number, also fortune
let g:startify_custom_header = [
\"                                                     (@@@@)    (@@@@@@@@)          ",
\"                                     (@@@)     (@@@@@@@@)   (@@@@@)              ",
\"                               (@@)     (@@@@@@@)    (@@@@@)    (@@@@@@@)     ",
\"                         (@@@@@@@)   (@@@@@)       (@@@@@@@@@@@@)       ",
\"                    (@@@)     (@@@@@@@)   (@@@@@@)         (@@@@@@@@@)   ",
\"               (@@@@@@)    (@@@@@@)     (@@@@@@)    (@@@@@@@@)              ",
\"           (@@@)  (@@@@)           (@@@@@)                      (@@@@)          ",
\"        (@@)              )                                        ",
\"       .-.                                                             ",
\"       ] [    .-.      _    .-----.                                    ",
\"     .'   ''''   '''''' ''''| .--`                                     ",
\"    (:--:--:--:--:--:--:--:-| [___    .------------------------.   .------------------------.   .------------------------.   .------------------------.   .------------------------.   .------------------------.   .------------------------.       ",
\"     | VIM :  :  :  :  :  : [_9_] |'='|.----------------------.|'='|.----------------------.|'='|.----------------------.|'='|.----------------------.|'='|.----------------------.|'='|.----------------------.|'='|.----------------------.|       ",
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

" EasyMotion {{{
" Turn off default mappings
let g:EasyMotion_do_mapping = 0
" EasyMotion }}}

" Outliner {{{
augroup Outliner
    au!
        autocmd BufWritePre  *.otl silent! :normal! m'
        autocmd BufWritePre  *.otl silent! :%s/\v^(	*|(    )*)    /\1	/|norm!``|:nohlsearch
        autocmd BufWritePre  *.otl silent! :%s/\v^(	*|(    )*)    /\1	/|norm!``|:nohlsearch
        autocmd BufWritePre  *.otl silent! :%s/\v^(	*|(    )*)    /\1	/|norm!``|:nohlsearch
        autocmd BufWritePre  *.otl silent! :%s/\v^(	*|(    )*)    /\1	/|norm!``|:nohlsearch
        autocmd BufWritePre  *.otl silent! :%s/\v^(	*|(    )*)    /\1	/|norm!``|:nohlsearch
        autocmd BufWritePre  *.otl silent! :%s/\v^(	*|(    )*)    /\1	/|norm!``|:nohlsearch
        autocmd BufWritePre  *.otl silent! :%s/\v^(	*|(    )*)    /\1	/|norm!``|:nohlsearch
        autocmd FileType *.otl set expandtab
        autocmd FileType *.otl set virtualedit=all
        autocmd BufWritePre  *.otl silent! :normal! `'

augroup END
" Outliner }}}

" Brightest {{{

let g:brightest_enable=0

" Brightest }}}

" Scratch {{{

"nmap <leader>s :Scratch<CR>

" Scratch }}}

"Outliner {{{
let g:vo_modules_load=''
"Outliner }}}

" SnipMate {{{

let g:snippets_dir = "$VIM/snippets/"

" SnipMate }}}


" Plugin Options }}}

" Set Options {{{

"TODO : unncessary? set runtimepath^=~/.vim/bundle/ctrlp.vim
" TODO slowly remove/replace this
"TODO
behave mswin
" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>
"
"TODO:
" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>
"TODO
" Alt-Space is System menu
if has("gui")
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>
endif

"
set autoread                         " Automatically reload a file when you select the buffer, if something else has modified it
set whichwrap+=<,>,[,]               " Allow curser to wrap around to the next or previous line
set backspace=indent,eol,start       " Allow backspacing over autoindent, line breaks, and past beggining of insert action
set cmdheight=2                      " Less 'press <Enter> to continue'
set confirm                          " Bring up a dialog asking if you want to save changes when actions which leave the buffer
set cursorline                       " Highlight cursor line
set expandtab                        " Spaces instead of tabs
set foldlevelstart=99                " Start all the way folded
set history=500                      " number of commands to keep in history
set ignorecase                       " Ignore make lowercase seaches case-insensitive
set incsearch                        " Automatically jump to any results whil typing in search
set lazyredraw                       " Don't showmacro actions, just update at the end for speed
set more                             " Enable scrolling of long command output
"set showmatch
"set matchtime=5
set hlsearch                         " Highlight search matches
set laststatus=2                     " Always display the status line
"set nobackup                         " Do not make a backup when overwriting a file
set hidden                           " Let the buffer remain in memory when not visible
"set nowritebackup                    " Do not write a backup when overwriting a file
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
set undofile                         " Persistent undo, across sessions
set directory=~/.vim/swap            " keep swap files in a special directory
set backupdir=~/.vim/backup            " keep swap files in a special directory
set undodir=~/.vim/undo           " Directory to keep persisten undo info
set linebreak                        " Visually wrap characters at the word boundary (the wrap that happens when you size a window to small)
set gdefault                         " switch %s/{pattern}/{pattern} with %s/{pattern/{pattern}/g, since i never want to replace just the first match on each line. hopefully this won't mess with plugins
set undolevels=50000                 " Save a lot of file changes for undo
set undoreload=100000                " Save a lot of file reloads for undo
set wrapscan
set splitright                       " make vsplits happen to the right instead of left
set splitbelow                       " make split happen below instead of above
set wildmode=list:longest            " shell style completion
set tw=0                             " don't chop lines at 78 characters
set nomore                          "don't pause and display 'More'
"set virtualedit=block                     " tab

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

" Fold {{{

function! FoldModeToggle()
    if !exists('g:fold_mode_state') 
        let g:fold_mode_state = 0
    endif

    if g:fold_mode_state == 0
        let g:fold_mode_state = 1
        set foldcolumn=1
        set foldlevel=1
        set foldminlines=1
        "set foldopen=all
        set foldclose=all
    else
        let g:fold_mode_state = 0
        set foldcolumn=0
        normal! zR
        set foldminlines=0
        "set foldopen=all
        set foldclose=
    endif

endfunction

" Fold }}}

" Key Functions {{{
function! BuildCtags(dir)
    execute 'cd' fnameescape(a:dir)

    if has("win32")
        silent !ctags.exe -R --exclude=builds --fields=+Ssaki --extra=+qf .
    elseif has ("unix")
        silent !ctags -R --exclude=debian --exclude=builds --exclude=build --flags=+saki --extra=+qf .
    endif
endfunction

function! BuildGtags(dir)
    execute 'cd' fnameescape(a:dir)
    :silent !gtags
endfunction

function! BuildAllTags(dir)
if g:is_win
    "TODO make or find a path abstraction interface/function so i can make
    "this 2 lines, not 6
    call BuildCtags(g:project_root_bs)<CR>
    call BuildGtags(g:project_root_bs)<CR>
else
    call BuildCtags(g:project_root_fs)<CR>
    call BuildGtags(g:project_root_fs)<CR>
endif
endfunction
  

function! UpdateVim()
    :Unite -buffer-name=neobundle -no-cursor-line -log neobundle/update
    ":call BuildHelpTags(g:docpaths)<CR>
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
    if !empty(a:text)
        echo ""
        echo "RunAg - Searching for: " . a:text
        echo "RunAg - Searching in: " . a:dir
"TODO change based on filetype for python and etc
	if g:is_win
        	let g:AgIgnoreString =' --file-search-regex .[(c)(cpp)(h)(hpp)(C)(CPP)(H)]$ '
	endif
	if g:is_nix
        	let g:AgIgnoreString =' --file-search-regex .\[\(c\)\(cpp\)\(h\)\(hpp\)\(C\)\(CPP\)\(H\)\]$ '
	endif

        let searchString =  "Ag! -S --stats " . g:AgIgnoreString . a:text . " " . a:dir
        execute searchString
    else
        echo "RunAg: no input string"
    endif
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
    :normal <c-w>j
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
" Note: you can view currently mapped keys with :map, :nmap:, inoremap, and etc
" Note: vim lists all it's default keys and command in ":help index"

let mapleader = " "

" Insert Mode Mappings {{{
inoremap <silent> <C-L> <Right>
inoremap <silent> <C-H> <Left>
inoremap <silent> <C-K> <Up>
inoremap <silent> <C-J> <Down>
"inoremap <silent> kj <esc> " Don't map this since words ending with k, you can't jk
inoremap <silent> jk <esc>
"inoremap <esc> <nop>
" }}}

" Normal Mode Mappings {{{


noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" inconvenient keys
nnoremap <F1> <nop>
"nnoremap Q <nop>
nnoremap Q @@

" less effort Ctrl+U & Ctrl+D
nnoremap <silent> K <C-U>
nnoremap <silent> J <C-D>
nnoremap j gj
nnoremap k gk

nnoremap ZC <ESC>:bd<CR>
nnoremap ZX <ESC>:BD<CR>
nnoremap ZW <ESC>:tabclose<CR>
nnoremap <leader>gf :call FoldModeToggle()<CR>

" Tab Mappings {{{
" use gt & gT "nnoremap <silent> <A-h> :tabprevious<CR>
"nnoremap <silent> <A-l> :tabnext<CR>
nnoremap <silent> <A-H> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-L> :execute 'silent! tabmove ' . tabpagenr()<CR>
" Tab Mappings }}}

" Fold Navigation Mappings {{{
nnoremap <silent> <A-k> zk
nnoremap <silent> <A-j> zj
nnoremap <silent> <A-a> za
nnoremap <silent> <A-A> zA
nnoremap <silent> <A-c> zM
nnoremap <silent> <A-e> zR
" Fold Navigation Mappings }}}


map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"C-\ will open the definition in a new tab
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"C-] will open the definition in a new split
" }}}

" Leader Key Mappings {{{


nnoremap <space><space> a<space><esc>
nnoremap <s-space><s-space> i<space><esc>
nnoremap <silent> <leader>/ :nohlsearch<CR>

"perhaps put all the misc unite ones under <leader>u{logical char}

" Quick Builds {{{
if has("win32")
    nmap <leader>bc <esc>:call BuildCtags(g:project_root_bs)<CR>
    nmap <leader>bg <esc>:call BuildGtags(g:project_root_bs)<CR>
    nmap <leader>bt <esc>:call BuildAllTags(g:project_root_bs)<CR>
    nmap <leader>bi <esc>:call ParseBuildLog(g:project_root_bs)<CR>
    nmap <leader>bI <esc>:e build.log<CR>

else
    nmap <leader>bc <esc>:call BuildCtags(g:project_root_fs)<CR>
    nmap <leader>bg <esc>:call BuildGtags(g:project_root_fs)<CR>
    nmap <leader>bt <esc>:call BuildAllTags(g:project_root_fs)<CR>
endif

    nnoremap <leader>bn :call UpdateVim()<CR>

"}}}

" Ag Mappings {{{
nmap <silent> <leader>ac <esc>:call RunAgOnWordUnderCursor(g:project_root_sys)<CR>
nmap <silent> <leader>Ac <esc>:call RunAgOnWordUnderCursor(g:current_loc_fs)<CR>
nmap <silent> <leader>ai <esc>:call RunAgOnInput(g:project_root_sys)<CR>

nmap <silent> <leader>Ai <esc>:call RunAgOnInput(g:current_loc_fs)<CR>
nmap <silent> <leader>an <esc>:call RunAgOnInput(g:docs_path)<CR>
" Ag Mappings }}}

" Text Formatting {{{
nnoremap <leader>tr :s/\s*$//<CR>
nnoremap <leader>tR :%s/\s*$//<CR><C-o>
vnoremap <leader>at :LiveEasyAlign
nnoremap <leader>at :LiveEasyAlign
" }}}


nmap <silent> <leader>gC <esc>:call GtagsRefSearch()<CR>
"TODO COPIED< DOUBLE CHECK
nmap <silent> <leader>gn <esc>:cn<CR>
nmap <silent> <leader>gp <esc>:cp<CR>
nmap <silent> <leader>gl <esc>:cl<CR>

nmap <silent> <leader>gu <esc>:GundoToggle<CR>
" Leader Key Mappings }}}

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
nnoremap <leader>; :s/\(\s\)*$/;/g<CR>
vnoremap <leader>; :s/\(\s\)*$/;/g<CR>
" }}}

" Tab Mappings {{{
nnoremap <silent> <leader>tn <esc>:tabnew<CR>
nnoremap <silent> <leader>tc <esc>:tabclose<CR>
nnoremap <silent> <leader>td <esc>:windo bd<CR>
"nnoremap <silent> <leader>th :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
"nnoremap <silent> <leader>tl :execute 'silent! tabmove ' . tabpagenr()<CR>
"}}}

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
nnoremap <leader>da <esc>A//TODO(sam):
nnoremap <leader>dr <esc>k/\/\/TODO(sam):<CR><esc>D
"}}}

" Text Insert {{{
nnoremap <leader>if a<c-r>=expand("%:t")<cr><esc>
"inoremap <leader>if <c-r>=expand("%:t")<cr>
vnoremap <leader>if da<c-r>=expand("%:t")<cr><esc>

nnoremap <leader>id a<C-R>=strftime("%m/%d/%y")<CR><ESC>
""inoremap <leader>id <C-R>=strftime("%m/%d/%y")<CR>
vnoremap <leader>id da<C-R>=strftime("%m/%d/%y")<CR><ESC>
"}}}

call unite#custom#source('file_rec/async','sorters','sorter_rank')
call unite#filters#matcher_default#use(['matcher_fuzzy']) " Use fuzzy selection in Unite Insert Mode
call unite#filters#sorter_default#use(['sorter_rank']) " Sort Fuzzy selection, by fuzziness, not alphabetical

" Quick Explorer {{{

function! OpenExplorerProject()
    if !empty(g:project_root_fs)
        execute 'Unite' 'file' '-path=' . g:project_root_fs
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
nnoremap <silent> <leader>e  :<C-u>UniteWithBufferDir  file                         -buffer-name=Explore\ Folder <CR>
nnoremap <silent> <leader>ua :<C-u>UniteBookmarkAdd                                 -buffer-name=Add\ Bookmark   <CR>
nnoremap <silent> <leader>j  :<C-u>Unite buffer                                                                  <CR>
nnoremap <silent> <leader>J  :<C-u>Unite buffer_tab                                                              <CR>
nnoremap <silent> <leader>k  :<C-u>Unite tab                                                                     <CR>
nnoremap <silent> <leader>l  :<C-u>Unite line                                       -buffer-name=Line\ Search    <CR>
nnoremap <silent> <leader>h  :<C-u>Unite file_mru                                   -buffer-name=History         <CR>
nnoremap <silent> <leader>ub :<C-u>Unite bookmark         -here                     -buffer-name=Bookmarks       <CR>
nnoremap <silent> <leader>uc :<C-u>UniteClose<CR>
nnoremap <silent> <leader>us :<C-u>UniteShow<CR>

nnoremap <silent> <leader>m  :<C-u>Unite jump                                       -buffer-name=Marks           <CR>
nnoremap <silent> <leader>y  :<C-u>Unite history/yank                               -buffer-name=Copies          <CR>
nnoremap <silent> <leader>gc :<C-u>Unite gtags/context    -immediately -auto-resize -buffer-name=Tag\ Context    <CR>
nnoremap <silent> \          :<C-u>Unite gtags/ref        -immediately -auto-resize -buffer-name=Tag\ Reference  <CR>
nnoremap <silent> <leader>gs :<C-u>Unite gtags/completion -immediately -auto-resize -buffer-name=Tag\ Completion <CR>
nnoremap <silent> <leader>gi :<C-u>Unite gtags/grep       -immediately -auto-resize -buffer-name=Tag\ Grep       <CR>
nnoremap <silent> ,          :<C-u>Unite gtags/def        -immediately -auto-resize -buffer-name=Tag\ Definition <CR>
nnoremap <silent> <leader>o  :<C-u>Unite -auto-preview outline -no-split            -buffer-name=Outline         <CR>
"use c-n & c-p for now, alt, ctrl, and shift are all no good for this
"inoremap <buffer> <A-j> <Plug>(unite_select_next_line)
"inoremap <buffer> <A-k> <Plug>(unite_select_previous_line)
" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_keys()
function! s:unite_keys()
  inoremap <buffer> <C-z> <Plug>(unite_toggle_mark_current_candidate)
  nnoremap <buffer> m <Plug>(unite_toggle_mark_current_candidate)
  nnoremap <buffer> K <C-U>
  nnoremap <buffer> J <C-D>
endfunction
" Unite Key Mappings }}}

"  Machine Specific {{{

if g:is_win " Windows Configuration

    set fileformat=dos " Will set the carriage returns to windows/style when saving/editing a file
    set fileformats=dos,unix " WIll try unix and windows style EOL when opening a file
    nnoremap <leader>tl :silent !C:\Progra~1\TortoiseSVN\bin\\TortoiseProc.exe /command:log /path:"%" /closeonend:4 /notempfile<CR>
    nnoremap <leader>td :silent !C:\Progra~1\TortoiseSVN\bin\\TortoiseProc.exe /command:diff /path:"%" /closeonend /notempfile<CR>
    nnoremap <leader>tm :execute "silent !C:\\Progra~1\\TortoiseSVN\\bin\\TortoiseProc.exe /command:repostatus /path:\"" . g:project_root_sys . "\" /closeforlocal"<CR>
    nnoremap <leader>tu :execute "silent !C:\\Progra~1\\TortoiseSVN\\bin\\TortoiseProc.exe /command:update /path:\"" . g:project_root_sys . "\" /closeforlocal"<CR>


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
        set lines=61 columns=244 " Maximize window
        "nmap <leader>w :w ++ff=unix<CR>
        nmap <leader>w :w<CR>

    elseif g:is_win " Windows Configuration
        function! SetFont()
            execute "set guifont=ProggyCleanTT:h".g:guifontsize.":cANSI"
        endfunction
        set guifont=ProggyCleanTT:h11:cANSI
        let g:guifontsize = 11
        map <F12> <ESC>:let g:guifontsize=g:guifontsize+1<CR>:call SetFont()<CR>
        map <F11> <ESC>:let g:guifontsize=g:guifontsize-1<CR>:call SetFont()<CR>
        "TODO try true fullscreen, like a vn
        set lines=71 columns=260 " For a 1080p screen
        nmap <leader>w :w<CR>

    endif

endif
"}}}

" AutoCmds {{{
"
augroup vimrc
    au!
    autocmd BufEnter *.c,*.cpp,*.h,*.hpp,*.txt,*.vim :call SetRoot()
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType text setlocal foldmethod=indent
    autocmd FocusLost * stopinsert
    autocmd FocusLost *.c,*.cpp,*.h,*.hpp wall
    autocmd bufwritepost vimrc source % " Re-Source vimrc wach time it is edited
    autocmd VimEnter * :echo 'Welcome Back: ' . g:hostname
    autocmd VimEnter * :call BuildHelpTags(g:docpaths)

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif

augroup END

augroup Binary
    au!
    autocmd BufReadPre   *.bin let &bin=1
    autocmd BufReadPost  *.bin if &bin | %!xxd
    autocmd BufReadPost  *.bin set ft=xxd | endif
    autocmd BufWritePre  *.bin if &bin | %!xxd -r
    autocmd BufWritePre  *.bin endif
    autocmd BufWritePost *.bin if &bin | %!xxd
    autocmd BufWritePost *.bin set nomod | endif
augroup END

"}}}
