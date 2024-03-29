
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.

runtime! debian.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ap/vim-css-color'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'captbaritone/better-indent-support-for-php-with-html'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dense-analysis/ale'
Plugin 'ngmy/vim-rubocop'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-airline/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"

" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.
syntax enable
colorscheme monokai

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set mouse=		" DISABLE mouse usage (fuck mouse)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


" Indenting customizing
set tabstop=4
set shiftwidth=4
"set noexpandtab
set expandtab
set number
set relativenumber
set smartindent

" http://vimdoc.sourceforge.net/htmldoc/starting.html#vimrc

set scrolloff=3         " keep 3 lines when scrolling
set ai                  " set auto-indenting on for programming

set showcmd             " display incomplete commands
set nobackup            " do not keep a backup file

set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell
set backspace=indent,eol,start  " make that backspace key work the way it should

syntax on               " turn syntax highlighting on by default
"filetype on             " detect type of file
"filetype indent on      " load indent file for specific file type

set t_RV=               " http://bugs.debian.org/608242, http://groups.google.com/group/vim_dev/browse_thread/thread/9770ea844cec3282

" Automatic comment following in Insert mode
"set formatoptions=tcqr

" Twig highlighting
autocmd BufNewFile,BufRead *.twig set syntax=html

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight ALEWarning term=bold,reverse cterm=NONE ctermfg=228 ctermbg=88 gui=NONE guifg=Yellow guibg=DarkGray

hi Search cterm=NONE ctermfg=black ctermbg=blue

" Ctags and Cscope
set tags=tags
cs add cscope.out
set cscopetag cscopeverbose

set laststatus=2

" Javacomplete2
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40

set wildignore+=*/node_modules/*
set wildignore+=*/mysql/*
set wildignore+=*/postgres/*
set wildignore+=*.csv
set wildignore+=*.cache
set wildignore+=*.sql
set wildignore+=*/tmp/*

"autocmd BufWritePost * :silent !./updategp.sh
"autocmd BufWritePost * :redraw!

map <TAB> :tabnext <CR>
map <S-tab> :tabprevious <CR>
"map <C-o> :NERDTreeToggle<CR>
"map <C-n> :tabnew \| :CtrlP . <CR>
map <C-n> :CtrlP . <CR>
"map <F10> :silent !./update.sh \| :redraw! <CR>
map <Bslash> "*y
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F10> :Explore . <CR>

command Ex Explore
command Te Texplore

let g:airline#extensions#branch#displayed_head_limit = 16
let g:airline#extensions#branch#format = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1

let g:ale_lint_on_text_changed='always'
let g:ale_lint_delay=0
let g:ale_lint_delay=0
let g:ale_ruby_rubocop_options="--config ~/.config/rubocop.yml"

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
