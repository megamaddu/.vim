" Vim configuration file
" Author: Jonathan Filip
" Tweaks: Michael Trotter


" ============================================================================
" Setup:
" ============================================================================

set nocompatible

" Set location so we can set variables accordingly
let location = "home_osx"
if exists("$CITADEL_ENV")
    if has("win32") || has("win64")
        let location="work_win"
    else
        let location="work_linux"
    endif
elseif has("win32") || has("win64")
    let location="home_win"
endif

function! InLocation(...)
    for l in a:000
        if g:location == l
            return 1
        endif
    endfor
    return 0
endfunction

execute pathogen#infect()
syntax on
filetype plugin indent on


" ============================================================================
" General Options:
" ============================================================================

set nu
set shortmess=flmnrxIstToO
set showmode
set history=1000
set nofoldenable foldmethod=manual
set browsedir=buffer
set shellslash
set hidden
set tags=./tags;/.
if !has("gui_running")
    set t_Co=256
    set term=xterm-256color
endif
if !has("gui_running") && has("clipboard")
    set clipboard=unnamed
endif

colorscheme lucius
if has("gui_running")
    LuciusLight
    "LuciusDark
else
    LuciusLight
    "LuciusDark
endif

set wildignore+=.svn\*,*.pyc,*.pyo,*.so,*.o,*.dll,*.lib,*.pyd
set wildignore+=*.obj,*.h5,*.ttf,*.pdf,*.xls,*.pcl,*.gz,*.png
set wildignore+=*.gif,*.jpg,*.ico,*.bak,*~
set wildignore+=*.sln,*.csproj,*.resx,*.suo
set wildignore+=*.exe,*.pdb,*.map
set wildignore+=*.doc
set wildignore+=tmp,tags,cscope.out

let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute "]

au BufNewFile,BufRead *.cshtml set filetype=html
au BufNewFile,BufRead *.src set filetype=erlang
au BufNewFile,BufRead rebar.config set filetype=erlang

noremap <silent> <leader>d :bd<CR>
noremap <silent> <leader>n :bn<CR>
noremap <silent> <leader>b :bp<CR>

" ============================================================================
" UI Options:
" ============================================================================

set cmdheight=1
set completeopt=longest,menu complete=.,w,b,u
set confirm
set guioptions=egc
set laststatus=2
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
set fillchars=
set mouse=a mousehide ttymouse=xterm2
set noequalalways
set noerrorbells novisualbell
set ruler showcmd
set scrollopt=jump,ver,hor
set showtabline=1
set sidescroll=10
set splitbelow splitright
set statusline=%<%f\ %h%m%r%y[%{&ff}]%=%-14.(%l,%c%V%)\ %P
set wildmenu wildmode=list:longest,full
set winminheight=0 winminwidth=0
set ignorecase incsearch nohlsearch smartcase
if has("gui_running")
    set title
    if InLocation("home_osx")
        set lines=80 columns=200 fuoptions=maxvert,maxhorz
    else
        set lines=60 columns=160
    endif
    if has("gui_win32") || has ("gui_win64")
        set guifont=Consolas:h10
    elseif has("gui_macvim")
        set guifont=Monaco:h11
    endif
else
    set guioptions+=aA
endif

if has("gui_running")
  hi MatchParen gui=bold guibg=#000000 guifg=#d0d0d7
else
  "hi MatchParen cterm=bold ctermbg=0 ctermfg=8
endif


" ============================================================================
" File Options:
" ============================================================================

set autoread
set encoding=utf-8
set fileformats=unix,dos
set nobackup nowritebackup noswapfile


" ============================================================================
" Editting Options:
" ============================================================================

set autoindent
set backspace=indent,eol,start
set formatoptions=tcrqn
set nowrap nojoinspaces
set showmatch
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab shiftround
set virtualedit=block
set whichwrap+=<,>,h,l
if version >= 703
    set cryptmethod=blowfish
endif


" ============================================================================
" Key Mappings:
" ============================================================================

let mapleader = ";"
let maplocalleader = ";"

" Easier saving/quitting/closing
noremap <silent> <leader>w :w<CR>
noremap <silent> <leader>q :q<CR>
noremap <silent> <leader>x :x<CR>

" Indenting in visual mode
vnoremap <tab> >gv
vnoremap <s-tab> <gv
vnoremap > >gv
vnoremap < <gv

vnoremap <BS> d
if InLocation("home_osx")
    inoremap <A-BS> <C-w>
elseif InLocation("home_win") || InLocation("work_win")
    inoremap <C-BS> <C-w>
endif

map <Leader>gq gqap

" Select up to the next non-text blob
vmap <C-j> /^[^a-zA-Z0-9]*$<CR>k
vmap <C-k> ?^[^a-zA-Z0-9]*$<CR>j

" Buffer contorls
noremap <silent> <leader>n :bnext<CR>
noremap <silent> <leader>p :bprev<CR>

" Diff commands
noremap <silent> <leader>dt :diffthis<CR>
noremap <silent> <leader>do :diffoff!<CR>

" Window control
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Resize windows
if has("gui_running")
    nnoremap <S-Up> 10<C-W>+
    nnoremap <S-Down> 10<C-W>-
    nnoremap <S-Left> 10<C-W><
    nnoremap <S-Right> 10<C-W>>
else
    nnoremap <Up> 10<C-W>+
    nnoremap <Down> 10<C-W>-
    nnoremap <Left> 10<C-W><
    nnoremap <Right> 10<C-W>>
endif

" Splitting
noremap <leader>sp :split<CR>
noremap <leader>vs :vsplit<CR>

" Shortcuts for clipboard copy/pasting
vnoremap zp "*p
vnoremap zy "*y
noremap zp "*p
noremap zy "*y

" Make x not yank to register
noremap x "_x

" CTRL-A is Select all, etc
if !InLocation("home_osx")
    noremap <C-A> ggVG
    inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
    cnoremap <C-A> <C-C>gggH<C-O>G
    onoremap <C-A> <C-C>gggH<C-O>G
    snoremap <C-A> <C-C>gggH<C-O>G
    xnoremap <C-A> <C-C>ggVG
    noremap <C-S> :w<CR>
endif

" Color scheme
nnoremap <F2> :LuciusLight<CR>
nnoremap <S-F2> :LuciusDark<CR>
nnoremap <C-F2> :LuciusDarkDim<CR>

" Windows copy, cut, and paste
if has("win32") || has("win64")
    exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
    exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

    " Fix shift + insert to use the paste scripts too
    imap <S-Insert> <C-V>
    vmap <S-Insert> <C-V>

    " Use CTRL-Q to do what CTRL-V used to do
    noremap <C-Q> <C-V>

    " CTRL-X and SHIFT-Del are Cut
    vnoremap <C-X> "+x
    vnoremap <S-Del> "+x

    " CTRL-C and CTRL-Insert are Copy
    vnoremap <C-C> "+y
    vnoremap <C-Insert> "+y

    " CTRL-V and SHIFT-Insert are Paste
    map <C-V> "+gP
    map <S-Insert> "+gP

    " Command mode paste
    cmap <C-V> <C-R>+
    cmap <S-Insert> <C-R>+
endif

" Don't bring up help on F1
map <F1> <ESC>
imap <F1> <ESC>

" Disable middle mouse button pasting
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>

" Get rid of Ex mode
nnoremap <S-Q> <Q>


" ============================================================================
" Commands:
" ============================================================================

command! -nargs=1 Title :set title titlestring=<args>

" Strip extra whitespace
command! Strip %s/\s\+$//

command! ReloadConfig :source ~/vimfiles/vimrc.vim
command! Config :e ~/vimfiles/vimrc.vim

command! Notes :cd ~/notes

" Change directory to current buffer
command! CD :lcd %:p:h

" More lenient to save command
command! W w
command! Q q
command! QA qa
command! Qa qa
command! Wq wq
command! WQ wq


" ============================================================================
" Plugin Options:
" ============================================================================

" " ----------------------------------------------------------------------------
" " Airline:
" " ----------------------------------------------------------------------------
" 
" let g:airline_left_sep=''
" let g:airline_right_sep=''

" ----------------------------------------------------------------------------
" Ctags:
" ----------------------------------------------------------------------------

let g:ctags_bin = "ctags"


" ----------------------------------------------------------------------------
" OmniSharp:
" ----------------------------------------------------------------------------

" Synchronous build (blocks Vim)
"autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
" Builds can also run asynchronously with vim-dispatch installed
autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuildAsync<cr>

"The following commands are contextual, based on the current cursor position.

autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
nnoremap <leader>fi :OmniSharpFindImplementations<cr>
nnoremap <leader>ft :OmniSharpFindType<cr>
nnoremap <leader>fs :OmniSharpFindSymbol<cr>
nnoremap <leader>fu :OmniSharpFindUsages<cr>
nnoremap <leader>fm :OmniSharpFindMembersInBuffer<cr>
" cursor can be anywhere on the line containing an issue for this one
" nnoremap <leader>x  :OmniSharpFixIssue<cr>
nnoremap <leader>tt :OmniSharpTypeLookup<cr>
nnoremap <leader>dc :OmniSharpDocumentation<cr>

" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'issues']
autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

"show type information automatically when the cursor stops moving
"autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
" this setting controls how long to pause (in ms) before fetching type / symbol information.
"set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
"set cmdheight=2

" Contextual code actions (requires CtrlP)
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

" rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>      
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>
" Automatically add new cs files to the nearest project on save
"autocmd BufWritePost *.cs call OmniSharp#AddToProject()
" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>

" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>


" ----------------------------------------------------------------------------
" Cpp Omnicomplete:
" ----------------------------------------------------------------------------

let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_NamespaceSearch = 2
let OmniCpp_ShowPrototypeInAbbr = 1


" ----------------------------------------------------------------------------
" CScope:
" ----------------------------------------------------------------------------

"if has("cscope")
"    set cscopequickfix=s-,c-,d-,i-,t-,e-
"    if filereadable("cscope.out")
"        set cscopetagorder=0
"        set cscopetag
"        set nocscopeverbose
"        cs add cscope.out
"        "set cscopeverbose
"    endif

"    " View the tag (g-] behavior)
"    nmap <C-@>v :tselect <C-R>=expand("<cword>")<CR><CR>
"    " Find this C symbol
"    nmap <C-@>s :lcscope find s <C-R>=expand("<cword>")<CR><CR>
"    " Find this definition
"    nmap <C-@>g :lcscope find g <C-R>=expand("<cword>")<CR><CR>
"    " Find functions called by this function
"    nmap <C-@>d :lcscope find d <C-R>=expand("<cword>")<CR><CR>
"    " Find functions calling this function
"    nmap <C-@>c :lcscope find c <C-R>=expand("<cword>")<CR><CR>
"    " Find this text string
"    nmap <C-@>t :lcscope find t <C-R>=expand("<cword>")<CR><CR>
"    " Find this egrep pattern
"    nmap <C-@>e :lcscope find e <C-R>=expand("<cword>")<CR><CR>
"    " Find this file
"    nmap <C-@>f :lcscope find f <C-R>=expand("<cword>")<CR><CR>
"    " Find files #including this file
"    nmap <C-@>i :lcscope find i <C-R>=expand("<cword>")<CR><CR>
"endif


" ----------------------------------------------------------------------------
" CtrlP:
" ----------------------------------------------------------------------------

set wildignore+=tmp,*.so,*.swp,*.zip,.git,node_modules,bower_components,dist

let g:ctrlp_map = '<leader>fp'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 0
let g:ctrlp_buftag_ctags_bin = g:ctags_bin
let g:ctrlp_switch_buffer = 'vh'
let g:ctrlp_extensions = ['buffertag']
"let g:ctrlp_custom_ignore = { }

noremap <silent> <leader>ff :CtrlPCurWD<CR>
noremap <silent> <leader>fb :CtrlPBuffer<CR>
noremap <silent> <leader>fr :CtrlPMRU<CR>
noremap <silent> <leader>ft :CtrlPBufTag<CR>


" ----------------------------------------------------------------------------
" Tern:
" ----------------------------------------------------------------------------

noremap <silent> <leader>td :TernDef<CR>
noremap <silent> <leader>tp :TernDefPreview<CR>


" " ----------------------------------------------------------------------------
" " Dbext:
" " ----------------------------------------------------------------------------
" 
" let g:dbext_default_prompt_for_parameters = 0
" let g:dbext_default_display_cmd_line = 1
" let g:dbext_default_SQLITE_bin = "sqlite3"
" let g:dbext_default_history_file = "$HOME/.dbext_sql_history.txt"


" " ----------------------------------------------------------------------------
" " Lucius:
" " ----------------------------------------------------------------------------
" 
" let g:projects = {}
" let g:databases = {}
" command! Tags call lucius#GenerateTags(fnamemodify(bufname('%'), \':p:h'), 0) " current file dir
" command! TagsForce call lucius#GenerateTags(fnamemodify(bufname('%'), \':p:h'), 1) " current file dir, force
" command! TagsCwd call lucius#GenerateTags(getcwd(), 0) " current cwd
" command! TagsCwdForce call lucius#GenerateTags(getcwd(), 1) " cwd, force
" command! -nargs=1 -complete=file Sqlite :call lucius#LoadSqlite(<q-args>)
" command! -nargs=1 -complete=custom,lucius#DatabaseComplete Database :call
"             \ lucius#LoadDatabase(<q-args>)
" command! -nargs=1 -complete=custom,lucius#DatabaseComplete Data :call
"             \ lucius#LoadDatabase(<q-args>)
" command! -nargs=1 -complete=custom,lucius#ProjectComplete Project :call
"             \ lucius#LoadProject(<q-args>)
" command! -nargs=1 -complete=custom,lucius#ProjectComplete Proj :call
"             \ lucius#LoadProject(<q-args>)
" 
" noremap <C-f> :call lucius#ToggleSearchHighlighting()<CR>
" nnoremap <F10> :call lucius#ToggleTextWidth()<CR>
" nnoremap <S-F10> :call lucius#ToggleWrap()<CR>
" nnoremap <F11> :call lucius#ToggleSpellCheck()<CR>
" nnoremap <F12> :call lucius#ToggleScrollbars()<CR>
" 
" if has("python")
"     command! -range EvalPythonRange call lucius#EvaluateCurrentRange()
"     map <silent> <F5> :EvalPythonRange<CR>
" endif


" " ----------------------------------------------------------------------------
" " NERD Commenter:
" " ----------------------------------------------------------------------------
 
let NERDShutUp = 1
let NERDRemoveExtraSpaces=0
 
 
" " ----------------------------------------------------------------------------
" " NERD Tree:
" " ----------------------------------------------------------------------------
 
let g:NERDTreeChDirMode = 0
let g:NERDChristmasTree = 1
let g:NERDTreeCaseSensitiveSort = 0
let g:NERDTreeIgnore = ['\.doc$', '\.pdf$', '\.xls$', '\.docx$',
            \'\.zip$', '\.dll$', '\.so$', '\.pyc$', '\~$']
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 32
 
map <F3> :NERDTreeToggle<CR>
map <C-F3> :NERDTree<CR>
map <S-F3> :NERDTreeClose<CR>

map <C-t> :tabn<Enter>
map <C-n> :tabnew<Enter>
map nt :NERDTreeTabsToggle<Enter>

" ----------------------------------------------------------------------------
" Python:
" ----------------------------------------------------------------------------

let python_highlight_all = 1
au BufEnter *.py :syntax sync fromstart " helps with ''' comments

let g:pyindent_open_paren = "&sw"
let g:pyindent_nested_paren = "&sw"
let g:pyindent_continue = "&sw"


" " ----------------------------------------------------------------------------
" " SQLUtilities:
" " ----------------------------------------------------------------------------
" 
" let g:sql_type_default = "sqlanywhere"
" let g:sqlutil_align_where = 0
" let g:sqlutil_align_comma = 1
" let g:sqlutil_align_first_word = 1
" let g:sqlutil_keyword_case = '\L'


" " ----------------------------------------------------------------------------
" " SuperTab:
" " ----------------------------------------------------------------------------
" 
" let SuperTabDefaultCompletionType = "context"
" let SuperTabContextDefaultCompletionType = "<c-n>"
" let SuperTabContextTextOmniPrecedence = ["&completefunc"]
" au BufEnter *.md,*.txt,*.wiki :let b:SuperTabNoCompleteAfter = g:SuperTabNoCompleteAfter + ['\.', '\*', '-', ')']


" ----------------------------------------------------------------------------
" Syntastic:
" ----------------------------------------------------------------------------

 let g:syntastic_check_on_open = 0
 let g:syntastic_echo_current_error = 1
 let g:syntastic_enable_signs = 1
 let g:syntastic_enable_balloons = 1
 let g:syntastic_always_populate_loc_list=1
 let g:syntastic_enable_highlighting = 1
 let g:syntastic_auto_loc_list = 1
 let g:syntastic_mode_map = {
             \ "mode": "passive",
             \ "active_filetypes": [],
             \ "passive_filetypes": [] }
 let g:syntastic_python_checkers = ["pyflakes"]
 map <Leader>syc :SyntasticCheck<CR>
 map <Leader>syr :SyntasticReset<CR>


" " ----------------------------------------------------------------------------
" " Tagbar:
" " ----------------------------------------------------------------------------
" 
" let g:tagbar_compact = 1
" let g:tagbar_iconchars = ['+', '-']
" let g:tagbar_ctags_bin = g:ctags_bin
" map <F4> :TagbarToggle<CR>
" 
" map <leader>t :echo tagbar#currenttag('%s','','fs')<CR>
" "set statusline=%<%f\ %h%m%r%y[%{&ff}]\ \ %{tagbar#currenttag('%s','','f')}%=%-14.(%l,%c%V%)\ %P


" " ----------------------------------------------------------------------------
" " VCS:
" " ----------------------------------------------------------------------------
" 
" let VCSCommandDeleteOnHide = 1
" augroup VCSCommand
"     au User VCSBufferCreated set bufhidden=wipe
" augroup END
" map <Leader>vd :VCSVimDiff<CR>


" " ----------------------------------------------------------------------------
" " VimClojure:
" " ----------------------------------------------------------------------------

"unmap <leader>p
"let g:vimclojure#HighlightBuiltins = 1
"let g:vimclojure#ParenRainbow = 1


" " ----------------------------------------------------------------------------
" " VimClojure Nailgun:
" " ----------------------------------------------------------------------------

"let vimclojure#WantNailgun = 1 
" this should only be necessary if you don't have the ng client in your PATH
"let vimclojure#NailgunClient = "/path/to/your/ng"


" " ----------------------------------------------------------------------------
" " Rainbow Parens:
" " ----------------------------------------------------------------------------

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" " ============================================================================
" " Autocommands:
" " ============================================================================
" 
" " Close the preview window automatically
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 
" " Set xaml to be like xml
" au BufNewFile,BufRead *.xaml setfiletype xml
" 
" " Format for xml
" au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
" 
" " Markdown
" au FileType markdown setlocal formatoptions-=l textwidth=79
" 
" " ICE
" au FileType slice setlocal cindent


" ============================================================================
" Functions:
" ============================================================================

" ----------------------------------------------------------------------------
" EditColors:
" ----------------------------------------------------------------------------

function! EditColors()
    execute 'e ~/vimfiles/colors/lucius.vim'
    execute 'so $VIMRUNTIME/syntax/hitest.vim'
    execute 'wincmd L'
    execute 'help syntax'
    execute 'wincmd ='
    execute '10wincmd +'
    execute '219'
    normal! zt
    execute 'wincmd h'
    execute 'set title titlestring=Colors'
endfunction
command! Colors call EditColors()


" ----------------------------------------------------------------------------
" GetOutput:
" ----------------------------------------------------------------------------

function! GetOutput(cmd)
    redir => message
    silent execute a:cmd
    redir END
    enew
    silent put=message
    set nomodified
endfunction
command! -nargs=+ -complete=command GetOutput call GetOutput(<q-args>)


" ----------------------------------------------------------------------------
" UseWorkSettings:
" ----------------------------------------------------------------------------

function! UseWorkSettings()
    "au BufNewFile,BufRead *.py set noexpandtab
    au BufNewFile,BufRead *.py set expandtab colorcolumn=80
    au BufNewFile,BufRead *.cpp set noexpandtab
    au BufNewFile,BufRead *.C set noexpandtab
    au BufNewFile,BufRead *.hpp set noexpandtab
    au BufNewFile,BufRead *.H set noexpandtab
    au BufNewFile,BufRead *.cs set noexpandtab
endfunction
command! WorkSettings :call UseWorkSettings()
if InLocation("work_win", "work_linux")
    WorkSettings
endif


" ============================================================================
" Local:
" ============================================================================

if filereadable(expand("~/.vimrc_local"))
    source ~/.vimrc_local
endif

