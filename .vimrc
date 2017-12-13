set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-latex/vim-latex'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'majutsushi/tagbar'
" Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Yggdroot/indentLine'
Plugin 'SirVer/ultisnips' 		" Track the engine.
Plugin 'honza/vim-snippets' 	" Snippets are separated from the engine. Add this if you want them:
Plugin 'ervandew/supertab' 		" YCM and Ultisnips
Plugin 'vim-scripts/Align'
" Plugin 'tpope/vim-fugitive' 	" git
Plugin 'tmhedberg/SimpylFold'

call vundle#end()            
filetype plugin indent on   
" To ignore plugin indent changes, instead use:
" filetype plugin on

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" YCM for cpp
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Latex-suite
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
let g:tex_indent_items=0

" TagBar
" let g:tagbar_width=25
" let g:tagbar_autofocus=1
" let g:tagbar_left = 1
" nmap <F3> :TagbarToggle<CR>

" NERD Tree
" nmap <F2> :NERDTreeToggle<cr>
" let NERDTreeChDirMode=1
" 显示书签"
" let NERDTreeShowBookmarks=1
" 设置忽略文件类型"
" let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" 窗口大小"
" let NERDTreeWinSize=25

" Vim powerline
let g:Powerline_symbols = 'fancy'

" IndentLine
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

" SimpleFold
let g:SimpylFold_docstring_preview=1

" Put your non-Plugin stuff after this line

syntax on 			" 代码高亮
set encoding=utf-8 	" 编码为utf8
set number 			" 显示行号
set ru  			" 显示标尺
set ts=4 			" 设置tab键为四个空格
set sw=4 			" shift width
set showmatch 		" match braket
set hlsearch        " 高亮搜索项,取消高亮 :nohl
nmap <F2> :nohl<cr>
set ignorecase 		" 忽略大小写
set showmode
set splitbelow
set splitright

set foldmethod=indent 	" Enable folding      " set foldmethod=syntax
set foldlevel=99
nnoremap <space> za		" Enable folding with the spacebar
au BufWinLeave * silent mkview
au BufWinEnter * silent loadview
