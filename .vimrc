execute pathogen#infect()

syntax enable
filetype plugin indent on
set background=light
colorscheme lucius

"set list
set lazyredraw
set nu
set scrolloff=7
set shortmess=flmnrxIstToO
set showmode
set history=1000
set nofoldenable foldmethod=manual
set browsedir=buffer
set shellslash
set hidden
set cmdheight=1
set completeopt=longest,menu complete=.,w,b,u
set confirm
set guioptions=egc
set laststatus=2
set showtabline=2
set noshowmode
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
set fillchars=
set mouse=a mousehide ttymouse=xterm2
set noequalalways
set noerrorbells novisualbell
set ruler showcmd
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
if version >= 703
  set cryptmethod=blowfish
endif

let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute "]

au BufNewFile,BufRead *.cshtml set filetype=html
au BufNewFile,BufRead *.src set filetype=erlang
au BufNewFile,BufRead rebar.config set filetype=erlang
au BufNewFile,BufRead *.cljx set filetype=clojure

let mapleader = ";"

noremap <silent> <leader>n :bn<CR>
noremap <silent> <leader>b :bp<CR>

noremap <silent> <leader>w :w<CR>
noremap <silent> <leader>q :q<CR>
noremap <silent> <leader>x :x<CR>

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

noremap x "_x


" Airline:
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''


" CtrlP:
set wildignore+=tmp,*.so,*.swp,*.zip,.git,node_modules,bower_components,dist

let g:ctrlp_map = '<leader>fp'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 0
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 0
let g:ctrlp_switch_buffer = 'vh'
"let g:ctrlp_extensions = ['buffertag']
"let g:ctrlp_custom_ignore = { }

noremap <silent> <leader>ff :CtrlPCurWD<CR>
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


" Rainbow Parens:
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

au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax clojure RainbowParenthesesToggle


" Vim Slime:
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "%1"}


" Fireplace:
map <leader>e :Eval<enter>
