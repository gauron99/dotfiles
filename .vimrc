" ~/.vimrc file
" author: github.com/gauron99
set number " Show current line #
set relativenumber " Show relative line #s

" when searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch
set incsearch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off
set nobackup
set nowb
set noswapfile

set tabstop=2
set shiftwidth=2

set ai "Auto indent
set si "Smart indent
set nowrap "Dont wrap lines

set laststatus=2

" Always display the cursor X number of lines off the edge of the screen
set scrolloff=8
nmap H ^
nmap L $

set colorcolumn=80
