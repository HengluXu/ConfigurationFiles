set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/.vim/local'
"call vundle#rc(path)

if filereadable(expand("~/.vim/.vimrc.bundle"))
	source ~/.vim/.vimrc.bundle
endif
call vundle#end()

filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on

syntax on								"开启语法高亮
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
set ts=4
set autoindent
set smartindent
filetype indent on						"自动、智能缩进
set showmatch
set showmode
set splitbelow
set splitright

set pastetoggle=<C-t> 					"paste toggle
set fileencodings=utf-8,chinese			"中文乱码"
set foldmethod=indent					"默认展开所有代码
nnoremap <space> za
set foldlevel=99
set ruler 								"显示当前的行号列号：
set number 								"显示行号：
set textwidth=90						"行宽
set wrap								"自动折行 "set nowrap

" 搜索
set hlsearch							"高亮搜索项
nnoremap <F2> :nohl<cr> 				"取消高亮
set incsearch 							" do incremental searching, search as you ty:wpe
set ignorecase 							" 忽略大小写
set smartcase 							" no ignorecase if Uppercase char present

"恢复上次光标位置
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"imap jj <Esc>
"imap <C-h> <left>
"imap <C-l> <right>
"cmap q<CR> qa<CR>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							nerdtree
"
let NERDTreeChDirMode=1
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeMinimalUI=1					"不显示帮助信息
let NERDTreeMouseMode = 2				"鼠标点击
let g:NERDTreeWinSize = 30
"忽略文件、隐藏文件
let NERDTreeIgnore = ['\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['\/$', 'Makefile', 'makefile', '*', '\~$']

nmap wm :NERDTreeToggle<cr>
"关闭当前窗口
nmap wc <C-w>c
"分割窗口
nmap wv <C-w>v
"打开quickfix
nmap wq :copen<cr>
"分割窗口移动快捷键
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
"autocmd BufRead *.py :NERDTreeToggle
"关闭窗口
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"ctags
"
"let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
"let Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8/bin/ctags'
"用法：$ ctags –R src
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							 tagbar
"autocmd BufRead *.* nmap tb :Tagbar<cr>
"let tagbar_ctags_bin='/usr/local/bin/ctags'
"let tagbar_width=35
"let g:tagbar_compact = 1
"let g:tagbar_autoshowtag = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 错误检查
"let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"set error or warning signs
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
"whether to show balloons
let g:syntastic_enable_balloons = 1

"安装flake8: easy_install flake8
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_jshint_exec = '/usr/local/bin/eslint'
'
"Default: 0
"If enabled, syntastic will do syntax checks when buffers are first loaded as
"well as on saving >
 "let g:syntastic_check_on_open=1

"Default: 0
"Enable this option to tell syntastic to always stick any detected errors into
"the loclist: >
 let g:syntastic_always_populate_loc_list=1

"Default: 2
"When set to 1 the error window will be automatically opened when errors are
"detected, and closed when none are detected. >
 let g:syntastic_auto_loc_list=1

"When set to 2 the error window will be automatically closed when no errors are
"detected, but not opened automatically. >
"let g:syntastic_auto_loc_list=2

"only errors no warnings
 let g:syntastic_quiet_messages={'level': 'warnings'}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 让Vim的补全菜单行为与一般IDE一致
set completeopt=longest,menu
" 不用每次提示加载.ycm_extra_conf.py文件
let g:ycm_confirm_extra_conf = 0
" 关闭ycm的syntastic
let g:ycm_show_diagnostics_ui = 0

" 评论中也应用补全
let g:ycm_complete_in_comments = 1
" 两个字开始补全
let g:ycm_min_num_of_chars_for_completion = 2
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
""上下左右键的行为 会显示其他信息
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-k>\<C-j>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-k>\<C-j>" : "\<PageUp>"
"set YouCompleteMe trigger key
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
"let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
"let g:ycm_key_list_previous_completion = ['<Up>']

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

let g:ycm_key_invoke_completion = '<Enter>'
let g:ycm_semantic_triggers =  {'c' : ['->', '.'], 'objc' : ['->', '.'], 'ocaml' : ['.', '#'], 'cpp,objcpp' : ['->', '.', '::'], 'php' : ['->', '::'], 'cs,java,javascript,vim,coffee,python,scala,go' : ['.'], 'ruby' : ['.', '::']}

autocmd BufRead *.py nnoremap <C-]> :YcmCompleter GoTo<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                jedi-vim
let g:jedi#goto_assignments_command = "<C-]>"
let g:jedi#usages_command = "<C-u>"
let g:jedi#documentation_command = "<C-g>"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               pydiction
 let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
 let g:pydiction_menu_height = 30
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"										ultisnips
" Track the engine.
"Bundle 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
"Bundle 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-o>"
let g:UltiSnipsJumpForwardTrigger="<C-tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
" 			let g:UltiSnipsEditSplit="horizontal"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 SimpylFold
" 代码折叠
let g:SimpylFold_docstring_preview=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  py文件头
autocmd bufnewfile *.py call HeaderPython()
function HeaderPython()
    call setline(1, "#!/usr/bin/env python")
    call append(1, "# -*- coding: utf-8 -*-")
    normal G
    normal o
    normal o
endf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"								 IndentLine
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "                                 docstring
" nmap <silent> <C-a> <Plug>(pydocstring)
" "template
" """"
" ":param {{_args_}}:
" "{{_indent_}}:return:
" """"
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "                                  ctrlP
" " 当前目录查找
" let g:ctrlp_working_path_mode = 'ra'
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "                               power-line
" set nocompatible   " Disable vi-compatibility
" set laststatus=2   " Always show the statusline
" set encoding=utf-8 " Necessary to show Unicode glyphs"
"
" let g:Powerline_symbols = 'fancy'
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latex-suite
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
"set grepprg=grep\ -nH\ $*
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
"let g:tex_flavor='latex'
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
"set iskeyword+=:
"let g:tex_indent_items=0



" 
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "                                markdown
" let g:vim_markdown_folding_style_pythonic = 1
" let g:vim_markdown_toc_autofit = 1
" autocmd BufRead *.md nmap tb :Toc<cr>
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Emmet
"
"			let g:user_emmet_expandabbr_key = '<C-e>'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
