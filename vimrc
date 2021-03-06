"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a
set nocompatible
set smarttab
set softtabstop=2
set sw=2
set smartindent
set autoindent
set ignorecase
set lsp=2
set et 
set hlg=en
set autoread
set smartcase
set hidden
set hls
set showmatch
set noerrorbells
set nobackup
set rnu
set cul
set background=dark
set showmode
set tabpagemax=15
" set mouse=a
set mousehide
set scrolloff=2
set wildmenu
set winminheight=0
set whichwrap=b,s,h,l,<,>,[,]
set scrolljump=5
set eadirection=hor
set equalalways
noh
" UI Stuffs
if has('cmdline_info')
  set ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
  set showcmd
endif
if has('statusline')
  set laststatus=2
  " Broken down into easily includeable segments
  set statusline=%<%f\     " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} " Git Hotness
  set statusline+=\ [%{&ff}/%Y]   " Filetype
  set statusline+=\ [%{getcwd()}] " Current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

syntax on
au Bufenter *.hs compiler ghc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY BINDINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap red edit <c-r>=expand("%:h")<cr>
inoremap <silent> <c-f> <esc>:noh<cr>l
nnoremap <silent> <c-f> <esc>:noh<cr>l
vnoremap <silent> <c-f> <esc>:noh<cr>
" Windows style saving
map <c-s> :w<cr>
imap <c-s> <esc>:w<cr>
" Windows undo
map <c-z> u
imap <c-z> <esc>ui
" Scrolling
nnoremap <Up> k
nnoremap <Down> j
nnoremap <C-k> <C-y><C-y><C-y>
nnoremap <C-j> <C-e><C-e><C-e>
inoremap <C-k> <esc><C-y><C-y><C-y>a
inoremap <C-j> <esc><C-e><C-e><C-e>a
" Ctrl backspace for deleting words
imap <C-Backspace> db 
" Better window key mappings
map <C-h> <C-W>h
map <C-l> <C-W>l
map <S-j> :bp<cr>
map <S-k> :bn<cr>
nnoremap <Leader>J :join<cr>
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <C-down> mz:m+<cr>`z
nmap <C-up> mz:m-2<cr>`z
vmap <C-down> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-up> :m'<-2<cr>`>my`<mzgv`yo`z
" Cross VIM instance yank/paste
vmap <silent> ,y "xy<CR>:wviminfo! ~/.viminfo<CR>
nmap <silent> ,p :rviminfo! ~/.viminfo<CR>"xp<CR>
" Reload file
nnoremap <f12> :so %<cr>
" Yank consistent with D and C, for yanking line use yy
nnoremap Y y$
" Visual Shifting
vnoremap < <gv
vnoremap > >gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUXILIARY FUNCTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
map <F8> :call NumberToggle()<cr> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Aliases
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command!  Nt :call NumberToggle()<cr> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Callbacks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufLeave,FocusLost * :set number
autocmd BufEnter,FocusGained * :set relativenumber
autocmd InsertEnter * :set number | :set nocul 
autocmd InsertLeave * :set relativenumber | :set cul

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Bundles!
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'godlygeek/csapprox'
Bundle 'godlygeek/tabular'
Bundle 'Gundo'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tomtom/tcomment_vim'
Bundle 'majutsushi/tagbar'
Bundle 'rstacruz/sparkup'
Bundle 'vim-scripts/TabBar'
Bundle 'vim-scripts/ScrollColors'
Bundle 'vim-scripts/SearchComplete'
Bundle 'vim-scripts/bufkill.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'leafo/moonscript-vim'
Bundle 'Shougo/neocomplete'
Bundle 'Shougo/unite.vim'
Bundle 'gkz/vim-ls'
Bundle 'Colour-Sampler-Pack'
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme Mustang
highlight Directory ctermfg=lightblue 
highlight StatusLine ctermfg=lightblue ctermbg=darkred
highlight LineNr ctermfg=lightgrey
highlight Tb_Changed ctermfg=red
highlight Tb_VisibleNormal ctermfg=white

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_leader_key = '<Leader>'
" Nerdtree 
nmap <silent> <c-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeShowBookmarks=1
let NERDTreeShowChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
" Tabularize
nmap <Leader>a& :Tabularize /&<cr>
vmap <Leader>a& :Tabularize /&<cr>
nmap <Leader>a= :Tabularize /=<cr>
vmap <Leader>a= :Tabularize /=<cr>
nmap <c-a> :Tabularize /=<cr>
vmap <c-a> :Tabularize /=<cr>
nmap <Leader>a: :Tabularize /:<cr>
vmap <Leader>a: :Tabularize /:<cr>
nmap <Leader>a, :Tabularize /,<cr>
vmap <Leader>a, :Tabularize /,<cr>
nmap <Leader>a<Bar> :Tabularize /<Bar><cr>
vmap <Leader>a<Bar> :Tabularize /<Bar><cr>
" Ctrlp
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$' }
" Tagbar
nnoremap <silent> <leader>tt :TagbarToggle<CR>
" Neocomplcache
"

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
"imap <C-k> <Plug>(neosnippet_expand_or_jump)
"smap <C-k> <Plug>(neosnippet_expand_or_jump)
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" ColorScroll
map <silent><f7> :PREVCOLOR<cr>
map <silent><f6> :NEXTCOLOR<cr>
" Gundo
nnoremap <f5> :GundoToggle<cr>
" BuffKill
nmap <Leader>x :BD<cr>

" Livescript tabs
au BufNewFile,BufReadPost *.ls setl shiftwidth=2 expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Loaded Banner
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo "################"
echo "# VIMRC LOADED #"
echo "################"
