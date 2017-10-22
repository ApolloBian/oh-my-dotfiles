
" ----- Setup Vundle      -----------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'vim-syntastic/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'
Plugin 'lilydjwg/fcitx.vim'                     " need to modify according to git repo readme
Plugin 'Valloric/YouCompleteMe'                     " need to modify according to git repo readme
call vundle#end()
filetype plugin indent on

" ----- General Settings  -----------------------------------------------------

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set ruler              " show the cursor position all the time
set hlsearch           " highlight search
set ignorecase         " ignore case when searching"'
set history=1000       " keep 1000 lines of command line history
set number             " line numbers
set numberwidth=5
set showcmd            " display incomplete commands
set incsearch          " do incremental searching
set linebreak          " wrap lines on 'word' boundaries
set scrolloff=8        " don't let the cursor touch the edge of the viewport
set splitright         " Vertical splits use right half of screen
set timeoutlen=100     " Lower ^[ timeout
set fillchars=fold:\ , " get rid of obnoxious '-' characters in folds
set tildeop            " use ~ to toggle case as an operator, not a motion
set lazyredraw         " make macros faster
set formatoptions-=r formatoptions-=c formatoptions-=o
syntax on
if exists('&breakindent')
    set breakindent      " Indent wrapped lines up to the same level
endif

set mouse=a
hi clear SignColumn     "We need this for plugins like Syntastic and vim-gitgutter which put symbols
                        " in the sign column.
" Tab settings
set expandtab          " Expand tabs into spaces
set tabstop=4          " default to 2 spaces for a hard tab
set softtabstop=4      " default to 2 spaces for the soft tab
set shiftwidth=4       " for when <TAB> is pressed at the beginning of a line

" For when you forget to sudo... Really Write the file.
" :W sudo write
if !(has('win32') || has('win64')) && !has("gui_running")
    command! W w !sudo tee % > /dev/null
endif


" ----- Make Vim look good ----------------------------------------------

colorscheme solarized
solorscheme gruvbox
set background=dark
let g:solarized_termcolors=256
let &t_Co=256
let g:solarized_termtrans=1
let g:solarized_bold=0
set encoding=utf-8
set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 12
set laststatus=2      " always show status bar

let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"
" set rtp+=/anaconda/lib/python2.7/site-packages/powerline/bindings/vim/



" ----- Plugin Nerdtree -----------------------------------------------
" nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 0       " To have NERDTree always open on startup
map <C-n> :NERDTreeToggle<CR>                        
let NERDTreeIgnore=['\.pyc$', '\~$']                  " ignore files in NERDTree
let NERDTreeShowHidden=0                              " show hidden files


" ----- Plugin Syntastic ----------------------------------------------
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = {"type" : "style"}
let g:syntastic_python_checker = ['flake8']



" ----- Plugin vim-easytags ---------------------------------------------
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- Plugin tagbar ----------------------------------------
" Open/close tagbar with \b
" nmap <silent> <leader>b :TagbarToggle<CR>
map <C-t> :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- Plugin vim-gitgutter ---------------------------------
let g:airline#extensions#hunks#non_zero_only = 1



" ----- Plugin delimitMate --------------------------------------------
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END


" ----- Plugin vim-superman ---------------------------------------------
noremap K :SuperMan <cword><CR>
