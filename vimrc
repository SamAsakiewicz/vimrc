"
"
"
"
" __      __  _____   __  __   _____     _____ 
" \ \    / / |_   _| |  \/  | |  __ \   / ____|
"  \ \  / /    | |   | \  / | | |__) | | |     
"   \ \/ /     | |   | |\/| | |  _  /  | |     
"    \  /     _| |_  | |  | | | | \ \  | |____ 
"     \/     |_____| |_|  |_| |_|  \_\  \_____|
                                              

" bye bye, Vi, and nice knowing ya, vanilla VIm
set nocompatible
                                              
"  **START OF NeoBundle**
"set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
set runtimepath+=~/.vim/bundle/neobundle.vim/
set runtimepath+=~/.vim/bundle/*
"let path='~/vimfiles/bundle'

 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

" Plugins Vundle will manage for you
NeoBundleFetch 'gmarik/Vundle.vim' " let Vundle manage Vundle, required
NeoBundleFetch 'rking/ag.vim'    " AG.vim - interface to ag.exe, a grep/ack replacement
NeoBundleFetch 'altercation/vim-colors-solarized'    " Solarized - a Solid Color Scheme
NeoBundleFetch 'kien/ctrlp.vim'    " CtrlP - Fuzzy File Search
"Plugin 'Shougo/neocomplcache.vim'    " neocomplcache - Autocompletion system for vim 
"NeoBundleFetch 'majutsushi/tagbar'    " TagBar - a pleasant code outline for the current buffer
NeoBundleFetch 'Lokaltog/vim-easymotion'
NeoBundleFetch 'jeffkreeftmeijer/vim-numbertoggle'
NeoBundleFetch 'mhinz/vim-startify'
"Plugin 'tpope/vim-surround'
"Plugin 'bling/vim-airline'
"Plugin 'linediff
"Plugin 'c.vim' or 'snipMate.vim'
NeoBundleFetch 'gtags.vim'    " Vim Support for GNU Global
NeoBundleFetch 'whatyouhide/vim-gotham'    " dark color scheme
NeoBundleFetch 'tpope/vim-unimpaired'    " each [x & ]x mappings
NeoBundleFetch 'godlygeek/tabular'
NeoBundleFetch 'AndrewRadev/splitjoin.vim'
NeoBundleFetch 'justinmk/vim-sneak'
NeoBundleFetch 'Shougo/unite.vim'
"NeoBundleFetch 'Shougo/vimproc.vim'
NeoBundleFetch 'Shougo/neomru.vim'
NeoBundleFetch 'Shougo/unite-outline'

 call neobundle#end()

 filetype plugin indent on

 " **END OF NEOBUNDLE**


"}}}

"     ____          _    _                    
"    / __ \        | |  (_)                   
"   | |  | | _ __  | |_  _   ___   _ __   ___ 
"   | |  | || '_ \ | __|| | / _ \ | '_ \ / __|
"   | |__| || |_) || |_ | || (_) || | | |\__ \
"    \____/ | .__/  \__||_| \___/ |_| |_||___/
"           | |                               
"           |_|                               

set runtimepath^=~/.vim/bundle/ctrlp.vim
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" Automatically cd into the directory that the file is in
"autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

set nohidden " When I close a tab, remove the buffer
set autoread
set nobackup
set nowritebackup "set noswapfile

set ruler "display cursor position in the bottom right
set laststatus=2 " Always display the status line, even if only one window is displayed
set cmdheight=2 "less 'press <Enter> to continue'
set number "Display line numbers
set confirm " bring up a dialog asking if you want to save changes when actions which leave the buffer
set visualbell " instead of beeping, induce seizures by screen flashing

set foldmethod=syntax
set foldlevelstart=20

set ignorecase "ignore make lowercase seaches case-insensitive
set smartcase "make searches with any uppercase letters be case-sensitive

"set smartindent    
"set cindent
filetype plugin indent on
syntax enable
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
set expandtab " Spaces instead of tabs
set smarttab
set tabstop=4 """ Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4

"use gcc
"compiler gcc
set cul " Highlight cursor line
hi CursorLine term=none cterm=none ctermbg=3      

set omnifunc=syntaxcomplete#Complete
set so=10
set background=dark

"is this optimal? maybe direct project root first, than tag back relay
set tags=g:project_root;./tags;/,tags;

set ff=dos
set ffs=dos

set tw=800 " Stop Vim from inserting newlines when you type past 80 chars

set foldtext=CustomFoldText()
highlight FoldColumn  gui=bold    guifg=grey65     guibg=Grey90
highlight Folded      gui=italic  guifg=Black      guibg=Grey90
highlight LineNr      gui=NONE    guifg=grey60     guibg=Grey90

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


"Functions

"not functional yet
function! GtagsRefSearch()
    :let wordUnderCursor = expand("<cword>")
    :execute "!Gtags -r " + wordUnderCursor
endfunction

function! BuildCtags(dir)
    execute 'cd' fnameescape(a:dir)
    !ctags.exe -R --exclude=builds .
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
    let searchString =  "Ag! -S --stats --ignore builds --ignore utility --ignore *.patch --ignore tags --ignore oldtags --ignore TMP " . a:text . " " . a:dir
    execute searchString
endfunction





"    __  __                       _                    
"   |  \/  |                     (_)                   
"   | \  / |  __ _  _ __   _ __   _  _ __    __ _  ___ 
"   | |\/| | / _` || '_ \ | '_ \ | || '_ \  / _` |/ __|
"   | |  | || (_| || |_) || |_) || || | | || (_| |\__ \
"   |_|  |_| \__,_|| .__/ | .__/ |_||_| |_| \__, ||___/
"                  | |    | |                __/ |     
"                  |_|    |_|               |___/      



let mapleader = " "

"fuzzy escapes to normal mode
inoremap jjj <Esc>jjj
inoremap kkk <Esc>kkk
inoremap hhh <Esc>hhh
inoremap lll <Esc>lll
" add ctrl-u/d?

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

nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-l> :wincmd l<CR>
nnoremap <silent> <c-h> :wincmd h<CR>

"nnoremap <silent> <c-K> :wincmd K<CR>                                                                                                                       
"nnoremap <silent> <c-J> :wincmd J<CR>                                                                                                                       
"nnoremap <silent> <c-H> :wincmd H<CR>                                                                                                                       
"nnoremap <silent> <c-L> :wincmd L<CR>

" Leader Key Mappings ----------------------------------
"
nmap <silent> <leader>/ :nohlsearch<CR>
nmap <silent> <leader>ev :tabnew $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>


" Quick Builds
nmap <silent> <leader>bc <esc>:call BuildCtags(g:projectDirectoryRoot)<CR>
nmap <silent> <leader>bg <esc>:call BuildGtags(g:projectDirectoryRoot)<CR>
nmap <silent> <leader>bn <esc>:NeoBundleUpdate<CR>

nmap <silent> <leader>ac <esc>:call RunAgOnWordUnderCursor(g:projectDirectoryRoot)<CR>
nmap <silent> <leader>ai <esc>:call RunAgOnInput(g:projectDirectoryRoot)<CR>

" Quick Tabs
nmap <silent> <leader>tn <esc>:tabnew<CR>

" Quick Ctags iteration
nmap <silent> <leader>n <esc>:tn<CR>
nmap <leader>p <esc>:tp<CR>

" Quick splits
nmap <silent> <leader>vn <esc>:vnew<CR>
nmap <silent> <leader>vs <esc>:vsplit<CR>
nmap <silent> <leader>hn <esc>:new<CR>
nmap <silent> <leader>hs <esc>:split<CR>

" Personal TODO
nnoremap <leader>df <esc>/TODO<CR>
nnoremap <leader>dF <esc>/TODO<CR>N
nnoremap <leader>da <esc>a//TODO:
nnoremap <leader>dr <esc>k/\/\/TODO:<CR><esc>D

" Unite
nnoremap <leader>E :<C-u>Unite file<CR>
nnoremap <leader>e :<C-u>Unite -start-insert file<CR>

call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>r :<C-u>Unite -start-insert file_rec<CR>
nnoremap <leader>l :<C-u>Unite -start-insert line<CR>
"nnoremap <leader>r :<C-u>Unite -start-insert file_rec/async:!<CR>

let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :<C-u>Unite history/yank<CR>

nnoremap <silent> <leader>b :<C-u>Unite buffer bookmark<CR>
nnoremap <silent> <leader>b :<C-u>Unite buffer bookmark<CR>
nnoremap <silent> <leader>m :<C-u>Unite -start-insert file_mru<CR>
nnoremap <silent> <leader>h :<C-u>Unite -start-insert history -buffer-name=history<CR>
nnoremap <silent> <leader>h :<C-u>Unite -start-insert outline  -buffer-name=Outline<CR>
"inoremap <buffer> <C-j> <Plug>(unite_select_next_line)
"inoremap <buffer> <C-k> <Plug>(unite_select_previous_line)

"other cool stuff, Unite mapping, action

nnoremap <silent> <leader>q :q<CR>
"nnoremap <silent> <leader>s :w<CR> " Machine specific so added later on


"let GTAGSLIBPATH=.:..:../..:../../..

" +++++++++++++++++++++++++++++++++++++++++++++++++++++
" +   _____  _     _    _  _____ _____ _   _  _____   +
" +  |  __ \| |   | |  | |/ ____|_   _| \ | |/ ____|  +
" +  | |__) | |   | |  | | |  __  | | |  \| | (___    +
" +  |  ___/| |   | |  | | | |_ | | | | . ` |\___ \   +
" +  | |    | |___| |__| | |__| |_| |_| |\  |____) |  +
" +  |_|    |______\____/ \_____|_____|_| \_|_____/   +
" +                                                   +
" +++++++++++++++++++++++++++++++++++++++++++++++++++++
"

let g:netrw_liststyle=0
let g:solarized_italic=0
colorscheme solarized


"let g:ctrlp_map = '<C-p>'
"let g:ctrlp_cmd = 'CtrlPMixed'
"let g:ctrlp_user_command = {
"\}
"ADD TEXT SEARCH, LOOK FOR CTAGS SEARCH?
"let g:ctrlp_extensions = ['mixed', 'quickfix', 'undo', 'line', 'changes', 'cmdline', 'menu']
let g:ctrlp_max_height = 20
let g:ctrlp_mruf_exclude = '/tmp.*\|/usr/share.*\|.*bundle.*\|.*\.git'
let g:ctrlp_switch_buffer = 'et'

"otherwise ctrlp will only lookat the first 15k files:
let g:ctrlp_max_files=0
"let g:ctrlp_by_filename = 0

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|s|i|o|lst|pbi|cout|icf)$',
  \ }

"    _  _             ___                    _   ___            _         
"   | \| | ___  ___  / __| ___  _ __   _ __ | | / __| __ _  __ | |_   ___ 
"   | .` |/ -_)/ _ \| (__ / _ \| '  \ | '_ \| || (__ / _` |/ _|| ' \ / -_)
"   |_|\_|\___|\___/ \___|\___/|_|_|_|| .__/|_| \___|\__,_|\__||_||_|\___|
"                                     |_|                                 

" START OF NEOCOMPLCACHE

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 0 "1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

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
                                                                    

"     _____ __      __ _            
"    / ____|\ \    / /(_)           
"   | |  __  \ \  / /  _  _ __ ___  
"   | | |_ |  \ \/ /  | || '_ ` _ \ 
"   | |__| |   \  /   | || | | | | |
"    \_____|    \/    |_||_| |_| |_|
"                                   
"                                   

if has("gui_running")

    " GVIM Configuration
    set guioptions-=T  "no toolbar(icon bar)
    set guioptions-=r  "no right-hand scroll bar
    set guioptions-=L  "no left-hand scroll bar

    if has("gui_gtk2")
        set guifont="ProggyCleanTT 12"
        nmap <leader>s :w ++ff=unix<CR>

    elseif has("gui_win32")
        set guifont=ProggyCleanTT:h11:cANSI
        nmap <leader>s :w<CR>
  endif
endif


"let hostname = substitute(system('hostname'), '\n', '', '')
"if hostname == "PC1"
    "set lines=71 columns=260
"elseif hostname == "pc2"
 "endif
"source hostname . "vim"

if exists("g:project_root")
   "Do soemthing
else
    let g:project_root = $PWD
endif

