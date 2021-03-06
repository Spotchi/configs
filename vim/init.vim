" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible
filetype off                  " required

let g:python3_host_prog = '/Users/quentin.laurent/anaconda2/envs/vimenv/bin/python'
let g:loaded_python_provider = 1
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/deoplete.nvim
set rtp+=~/.vim/bundle/nvim-yarp
set rtp+=~/.vim/bundle/vim-hug-neovim-rpc
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" JEDI : python completion
Plugin 'zchee/deoplete-jedi'
let g:deoplete#sources#jedi#python_path = '/Users/quentin.laurent/anaconda2/envs/vimenv/bin/python'
Plugin 'scrooloose/nerdtree'

Plugin 'tomtom/tcomment_vim'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
"

" Airline theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" A color scheme
Plugin 'joshdick/onedark.vim'
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
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this lin
" set the tabs to be whitespaces

" Start NERDTree when Vim starts
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p



" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros


set ts=4
set sts=4
set sw=4
set smarttab
set expandtab

" show the line numbers
set number
set numberwidth=7
" syntax highlighting
syntax on

" No swap file
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set ruler         " show the cursor position all the time
set showcmd       " display incomplete command
" set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END " https://jeffkreeftmeijer.com/vim-number/
"set nonumber norelativenumber
"set number !relativenumber
" set autowrite : don't like that
set autoread      " Reload files changed outside vim
" Plugin 'Valloric/YouCompleteMe' " auto-complete

"Allow usage of mouse in iTerm
set ttyfast
set mouse=a

set guifont=Inconsolata\ for\ Powerline:h24

" Make it obvious where 100 characters is
set textwidth=100
" set formatoptions=cq
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1

" Map esc to caps lock when entering vim and restore it when quitting


" Map Ctrl-j to Ctrl-w then j (for fast window switching)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new window to right and bottom
set splitbelow
set splitright


"Max out the height of the current split
"ctrl + w _

"Max out the width of the current split
" ctrl + w |

" python-mode configuration
" let g:pymode=0
let g:pymode_indent=0
let g:pymode_motion=0
let g:pymode_doc=0
let g:pymode_breakpoint=1
let g:pymode_lint=0
let g:pymode_rope=0
let g:pymode_syntax=0

" Set the clipboard in vim to the os clipboard


" Airline {{{
		let g:airline_powerline_fonts=1
		let g:airline_left_sep=''
		let g:airline_right_sep=''
		let g:airline_theme='base16'
		let g:airline#extensions#tabline#show_splits = 0
		let g:airline#extensions#whitespace#enabled = 0
		" enable airline tabline
		let g:airline#extensions#tabline#enabled = 1
		" only show tabline if tabs are being used (more than 1 tab open)
		let g:airline#extensions#tabline#tab_min_count = 2
		" do not show open buffers in tabline
		let g:airline#extensions#tabline#show_buffers = 0
		" Show errors in airline from ALE
		let g:airline#extensions#ale#enabled = 1
	" }}}
" }}}
"

" Colorscheme and final setup {{{
	" This call must happen after the plug#end() call to ensure
	" that the colorschemes have been loaded
	if filereadable(expand("~/.vimrc_background"))
		let base16colorspace=256
		source ~/.vimrc_background
	else
"		let g:onedark_termcolors=16
"		let g:onedark_terminal_italics=1
		colorscheme onedark
	endif
	syntax on
	filetype plugin indent on
	" make the highlighting of tabs and other non-text less annoying
	highlight SpecialKey ctermfg=236
	highlight NonText ctermfg=236

	" make comments and HTML attributes italic
	highlight Comment cterm=italic
	highlight htmlArg cterm=italic
	highlight xmlAttrib cterm=italic
	highlight Type cterm=italic
	highlight Normal ctermbg=none

" }}}
