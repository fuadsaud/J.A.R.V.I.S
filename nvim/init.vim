"
" vimrc by fs
"

set shell=/bin/sh

set encoding=utf-8
set modelines=0
set autoread
set visualbell
set noshowmode
set showcmd
set clipboard=unnamed
set mouse=a
set relativenumber
set number
set cursorline
set colorcolumn=80,100,120
set hidden
set splitbelow
set splitright
set title
set showmatch
set list
set nobackup
set noswapfile
set undofile
set lazyredraw
set wildmenu
set wildmode=longest,full
set fillchars=vert:│

set termguicolors

" whitespace
set autoindent
set copyindent
set nowrap
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set smarttab
set expandtab
set backspace=indent,eol,start
set textwidth=100

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
set inccommand=split

" folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

filetype off | source ~/.config/nvim/plug.vim
filetype plugin indent on
syntax on

set omnifunc=syntaxcomplete#Complete

if has('autocmd')
  autocmd FileType c          setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType cpp        setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType cpp        setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType css        setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType scss       setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType go         setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType haskell    setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html       setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType java       setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType json       setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType make       setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType objc       setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType python     setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType scss.css   setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType yaml       setlocal ts=2 sts=2 sw=2 expandtab

  autocmd FileType markdown,text,tex DittoOn

  autocmd Filetype gitcommit  setlocal spell textwidth=72

  autocmd BufNewFile,Bufread *.hl   setfiletype clojure
  autocmd BufNewFile,BufRead *.rss  setfiletype xml
  autocmd BufNewFile,BufRead *.skim setfiletype slim

  autocmd FileType go nmap <buffer> = <Esc>:Fmt<CR>
endif

highlight link hspecDescribe Type
highlight link hspecIt Identifier
highlight link hspecDescription Comment

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tabs_label = fnamemodify(getcwd(), ':t')

let g:AutoPairsMultilineClose = 0
let g:AutoPairsFlyMode = 0

let g:netrw_browse_split = 0
let g:netrw_liststyle=3
let g:netrw_preview=1

let g:UltiSnipsExpandTrigger       = '<tab>'
let g:UltiSnipsJumpForwardTrigger  = '<c-b>'
let g:UltiSnipsJumpBackwardTrigger = '<c-z>'
let g:UltiSnipsEditSplit           = 'vertical'

let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

let g:splitjoin_ruby_do_block_split = 0

let g:jsx_ext_required = 0

let g:sexp_enable_insert_mode_mappings = 0

let g:acid_log_messages=1
let g:acid_eval_command_handler = ['MetaRepl']

let g:deoplete#enable_at_startup = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

function! OnTabEnter(path)
  " echo "path: " . a:path
  " echo "is: " . isdirectory(a:path)
  if isdirectory(a:path)
    let dirname = a:path
    " echo "dir tcd " . dirname
  else
    let dirname = fnamemodify(a:path, ":h")
    " echo "file tcd " . dirname
  endif
  " execute "tcd ". dirname
endfunction()
autocmd TabNewEntered * call OnTabEnter(expand("<amatch>"))

source ~/.config/nvim/colors.vim
source ~/.config/nvim/rainbow.vim
source ~/.config/nvim/mappings.vim

augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir)
          \   && (a:force
          \       || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

set lispwords+=fact,facts,flow
