execute pathogen#infect()

syntax enable
filetype plugin indent on
set background=dark
colo lucius

"set list
set lazyredraw
set ttyfast
"set nu
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
set mouse=a mousehide ttymouse=xterm2
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

let mapleader = ";"

noremap <silent> <leader>n :bn<CR>
noremap <silent> <leader>b :bp<CR>

noremap <silent> <leader>w :w<CR>
noremap <silent> <leader>q :qa<CR>
noremap <silent> <leader>x :x<CR>

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

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

set pastetoggle=<F2>


" CtrlP:
set wildignore+=tmp,*.so,*.swp,*.zip,.git,node_modules,bower_components,dist,target,out

let g:ctrlp_map = '<leader>ff'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_show_hidden = 0
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 0
let g:ctrlp_switch_buffer = 'vh'

noremap <silent> <leader>fp :CtrlPLastMode<CR>
noremap <silent> <leader>fb :CtrlPBuffer<CR>
noremap <silent> <leader>fr :CtrlPMRU<CR>
noremap <silent> <leader>ft :CtrlPBufTag<CR>


" Tern:
"noremap <silent> <leader>td :TernDef<CR>
"noremap <silent> <leader>tp :TernDefPreview<CR>


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
map <leader>e :Eval<enter>


" Dbext:
let g:localvimrc_whitelist = "/Users/trotter"


" LimeLight:
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.7


" Goyo:
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
nnoremap <F3> :Goyo<CR>
"autocmd BufNewFile,BufRead * :Goyo
