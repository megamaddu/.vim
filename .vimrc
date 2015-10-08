call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
" Plug 'jonathanfilip/vim-lucius'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/vim-easy-align'
Plug 'Valloric/YouCompleteMe', {'do': 'sh install.py'}
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'godlygeek/tabular'
Plug 'sirver/ultisnips'
Plug 'Shougo/vimproc.vim'
Plug 'majutsushi/tagbar'

Plug 'Shougo/vimproc.vim', {'do': 'make -f make_mac.mak'}
Plug 'Shougo/deoplete.nvim'

Plug 'pbrisbin/vim-syntax-shakespeare'

Plug 'vim-scripts/paredit.vim', {'for': 'clojure'}
Plug 'guns/vim-clojure-static', {'for': 'clojure'}
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'tpope/vim-salve', {'for': 'clojure'}

Plug 'wlangstroth/vim-racket', {'for': 'racket'}

Plug 'kchmck/vim-coffee-script', {'for': 'coffeescript'}

Plug 'othree/html5.vim', {'for': 'html'}

Plug 'raichoo/haskell-vim', {'for': 'haskell'}
Plug 'eagletmt/neco-ghc', {'for': 'haskell'}
Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
" Plug 'bitc/vim-hdevtools', {'for': 'haskell'}
" Plug 'kana/vim-textobj-indent', {'for': 'haskell'}

Plug 'raichoo/purescript-vim', {'for': 'purescript'}

Plug 'lambdatoast/elm.vim', {'for': 'elm'}

Plug 'rust-lang/rust.vim', {'for': 'rust'}

Plug 'junegunn/seoul256.vim', {'for': 'erlang'}

Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}

Plug 'fatih/vim-go', {'for': 'go'}

Plug 'tpope/vim-haml', {'for': 'haml'}

Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
Plug 'mxw/vim-jsx', {'for': 'javascript'}
Plug 'facebook/vim-flow', {'for': 'javascript'}

Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'mtscout6/vim-cjsx', {'for': 'coffee'}

Plug 'OmniSharp/omnisharp-vim', {'for': 'cs'}
"Plug 'OrangeT/vim-csharp', {'for': 'cs'}

Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}

call plug#end()

syntax enable
filetype plugin indent on
set background=dark
colo solarized

set omnifunc=syntaxcomplete#Complete
set nolazyredraw
" set timeoutlen=50
set number
set scrolloff=7
set shortmess=flmnrxIstToO
set history=1000
set nofoldenable foldmethod=manual
set browsedir=buffer
set shellslash
set hidden
set cmdheight=1
set completeopt=longest,menu complete=.,w,b,u
set confirm
set guioptions=egc
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
set fillchars=
set mouse=a mousehide " ttymouse=xterm2
set noequalalways
set noerrorbells novisualbell
set scrollopt=jump,ver,hor
set sidescroll=10
set splitbelow splitright
set statusline=%<%f\ %h%m%r%y[%{&ff}]%=%-14.(%l,%c%V%)\ %P
set wildmenu wildmode=list:longest,full
set winminheight=0 winminwidth=0
set ignorecase incsearch nohlsearch smartcase
set wildignore+=.svn\*,*.pyc,*.pyo,*.so,*.o,*.dll,*.lib,*.pyd
set wildignore+=*.obj,*.h5,*.ttf,*.pdf,*.xls,*.pcl,*.gz,*.png
set wildignore+=*.gif,*.jpg,*.ico,*.bak,*~
set wildignore+=*.sln,*.csproj,*.resx,*.suo
set wildignore+=*.exe,*.pdb,*.map
set wildignore+=*.doc
set wildignore+=tmp,tags,cscope.out
set autoread
set encoding=utf-8
set fileformats=unix,dos
set nobackup nowritebackup noswapfile
set autoindent
set backspace=indent,eol,start
set formatoptions=tcrqn
set nowrap nojoinspaces
set showmatch
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab shiftround
set virtualedit=block
set whichwrap+=<,>,h,l
if version >= 703 && !has("nvim")
  set cryptmethod=blowfish
endif
if has("gui_running")
  set guicursor+=a:blinkon0
  set guifont=Source_Code_Pro:h11
endif
set clipboard=unnamed
set noshowmode
set ruler
set laststatus=2
set showcmd
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <S-h> :call ToggleHiddenAll()<CR>
"autocmd BufNewFile,BufRead * :call ToggleHiddenAll()

let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute "]

au BufNewFile,BufRead *.cshtml set filetype=html
au BufNewFile,BufRead *.src set filetype=erlang
au BufNewFile,BufRead rebar.config set filetype=erlang
au BufNewFile,BufRead *.cljx set filetype=clojure
au BufNewFile,BufRead *.pxi set filetype=clojure

let mapleader = ";"

noremap <silent> <leader>n :bn<CR>
noremap <silent> <leader>b :bp<CR>
noremap <silent> <leader>x :bp\|bd #<CR>

noremap <silent> <leader>w :w<CR>
noremap <silent> <leader>q :q<CR>
noremap <silent> <leader><S-q> :qa<CR>

noremap <silent> <leader><tab> :NERDTree<CR>
noremap <silent> <leader>p :set invpaste paste?<CR>

if has("nvim")
  tnoremap <C-w> <C-\><C-n><C-w>
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

noremap x "_x

vnoremap <tab> >gv
vnoremap <s-tab> <gv
vnoremap > >gv
vnoremap < <gv

vmap <C-j> /^[^a-zA-Z0-9]*$<CR>k
vmap <C-k> ?^[^a-zA-Z0-9]*$<CR>j

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

noremap <leader>sp :split<CR>
noremap <leader>vs :vsplit<CR>


" Airline:
let g:airline_left_sep=''
let g:airline_right_sep=''


" CtrlP:
set wildignore+=tmp,*.so,*.swp,*.zip,.git,node_modules,jspm_packages,bower_components,dist,target,out,output

let g:ctrlp_map = '<leader><Space>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_show_hidden = 0
let g:ctrlp_max_height = 30
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_lazy_update = 10
let g:ctrlp_switch_buffer = 'vh'

noremap <silent> <leader>fp :CtrlPLastMode<CR>
noremap <silent> <leader>fb :CtrlPBuffer<CR>
noremap <silent> <leader>fr :CtrlPMRU<CR>
noremap <silent> <leader>ft :CtrlPBufTag<CR>


" Deoplete:
let g:deoplete#enable_at_startup = 1


" Jsx:
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 0


" NERD Commenter:
let NERDShutUp = 1
let NERDRemoveExtraSpaces=0


" Syntastic:
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


" Vim Slime:
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "%1"}


" Fireplace:
map <leader>e :Eval<cr>


" Dbext:
let g:localvimrc_whitelist = "/Users/trotter"


" Neco-ghc:
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:necoghc_enable_detailed_browse = 1


" Paredit:
let g:paredit_electric_return = 0
let g:paredit_smartjump = 1
" let g:paredit_shortmaps = 1


" EditorConfig:
let g:EditorConfig_core_mode = 'external_command'


" Flow:
let g:flow#autoclose = 1
map <leader>fc :FlowMake<cr>
map <leader>ft :FlowToggle<cr>
map <leader>fv :FlowType<cr>
map <leader>fa :FlowFindRefs<cr>


" Standardjs:
" let g:syntastic_javascript_checkers = ['standard']
" autocmd bufwritepost *.js silent !standard % --format
" autocmd bufwritepost *.jsx silent !standard % --format
" set autoread


" Haskell:
autocmd BufWritePost *.hs GhcModCheckAndLintAsync
let &l:statusline = '%{empty(getqflist()) ? "[No Errors]" : "[Errors Found]"}' . (empty(&l:statusline) ? &statusline : &l:statusline)

au FileType haskell nnoremap <buffer> <F1> :GhcModType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :GhcModTypeClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :GhcModInfo<CR>
" au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
" au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
" au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

autocmd BufEnter *.hs set formatprg=pointfree

let g:ghcmod_hlint_options = ['--ignore=Redundant do']


" Tagbar:
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
