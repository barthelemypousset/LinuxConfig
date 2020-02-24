"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load default config at start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This file loads the default vim options at the beginning and prevents
" that they are being loaded again later. All other options that will be set,
" are added, or overwrite the default settings. Add as many options as you
" whish at the end of this file.

" Load the defaults
source /usr/share/vim/vim80/defaults.vim

" Prevent the defaults from being loaded again later, if the user doesn't
" have a local vimrc (~/.vimrc)
let skip_defaults_vim = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => stuff needed for vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVIm/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'osyo-manga/vim-over'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
"filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<space>"

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

set mouse=r

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show relative line number and current line number
set rnu nu

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" display command while being writen
set showcmd

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" go to next line at eol
set whichwrap+=<,>,h,l

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
"set lazyredraw

" For regular expressions turn magic on (special characters will have their function by default. no / needed)
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Double hit " to get current register list
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>
nnoremap <silent> mm :marks<CR>
nnoremap <leader>r  :OverCommandLine<CR> %s/<C-r><C-w>/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlight
syntax enable

" Background is often dark
set background=dark

" Show trailing spaces and non breaking spaces
set listchars=trail:◃,nbsp:•
set list


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 4 spaces as tab
set tabstop=4
set shiftwidth=4
"set textwidth=119
set expandtab

"set ai "Auto indent
"set si "Smart indent
set wrap "Wrap lines

set fileformat=unix


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search down into subfolders Provides tab-completion for all file-related tasks
set path+=**


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Backup and temp Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set backup dir
set backupdir=~/.vimbak/backup,/tmp/vimbak/backup
" Set swap dir
set directory=~/.vimbak/swap,/tmp/vimbak/swap
" Set undo dir
set undodir=~/.vimbak/undo,/tmp/vimbak/undo
