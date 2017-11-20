set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-latex/vim-latex'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'tomasr/molokai'			" for color
Plugin 'Yggdroot/indentLine'
Plugin 'SirVer/ultisnips' 		" Track the engine.
Plugin 'honza/vim-snippets' 	" Snippets are separated from the engine. Add this if you want them:
Plugin 'ervandew/supertab' 		" YCM and Ultisnips
Plugin 'vim-scripts/Align'
Plugin 'tpope/vim-fugitive' 	" git

call vundle#end()            
filetype plugin indent on   
" To ignore plugin indent changes, instead use:
" filetype plugin on

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" latex suite
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:
" autocmd BufNewFile,BufRead *.tex set spell " 自动拼写检查
let g:tex_indent_items=0

" TagBar
let g:tagbar_width=25
let g:tagbar_autofocus=1
let g:tagbar_left = 1
" nmap <F3> :TagbarToggle<CR>

" NERD Tree
" nmap <F2> :NERDTreeToggle<cr>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
" let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=25

" Vim powerline
let g:Powerline_symbols = 'fancy'

" IndentLine
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Put your non-Plugin stuff after this line

syntax on 			" 代码高亮
set number 			" 显示行号
set ts=4 			" 设置tab键为四个空格
set showmatch 		" match braket
set hlsearch        " 高亮搜索项"
set ignorecase 		" 忽略大小写
" set spell 		" 拼写检查
" set wrap
" set ruler
" set incsearch
set showmode
