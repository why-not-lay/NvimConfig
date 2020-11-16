"路径配置
let g:python_host_prog='/usr/bin/python2'
"let g:python3_host_prog='/usr/bin/python3'
let g:python3_host_prog='/usr/bin/python3.7'

"常规配置
let mapleader=" "
set number
set cursorline
set showcmd
set relativenumber

set hlsearch
exec "nohlsearch"

set incsearch
set ignorecase
set smartcase
set expandtab

set tabstop=2
set shiftwidth=2
set softtabstop=2
set wildmenu

set list
set backspace=indent,eol,start
set scrolloff=10

"set foldmethod=indent

noremap j hzz
noremap k jzz
noremap i kzz
noremap h i
noremap H I
noremap I 5kzz
noremap K 5jzz
noremap = nzz
noremap - Nzz
noremap 0 ^
noremap ^ 0
noremap G Gzz
noremap <C-o> <C-o>zz

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source ~/.config/nvim/init.vim<CR>
"分屏
map zi :set nosplitbelow<CR>:split<CR>
map zk :set splitbelow<CR>:split<CR>
map zl :set splitright<CR>:vsplit<CR>
map zj :set nosplitright<CR>:vsplit<CR>
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <LEADER>j <C-w>h
map <LEADER>l <C-w>l
map <down> :res +5<CR>
map <up> :res -5<CR>
map <right> :vertical resize-5<CR>
map <left> :vertical resize+5<CR>
"标签页
map t0 :tabe<CR>
map tl :+tabnext<CR>
map tj :-tabnext<CR>

"控制台
map <M-t> zk:te<CR>
tnoremap <Esc> <C-\><C-n>

"===========
"===========
"vim-plug
"===========
"===========

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
"Plug 'scrooloose/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() },'for':'markdown' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dhruvasagar/vim-table-mode', {'for':'markdown'}
Plug 'mzlogin/vim-markdown-toc', {'for':'markdown'}
Plug 'majutsushi/tagbar',{'on':'TagbarToggle'}
Plug 'junegunn/vim-peekaboo'
Plug 'Chiel92/vim-autoformat'
call plug#end()

"===========
"===========
"vim-airline
"===========
"===========


"============
"Snazzy
"============
"============
let g:SnazzyTransparent=1
color snazzy

"============
"nerdtree
"x
"============
"============
"map tt :NERDTreeToggle<CR>
"map fc :NERDTreeClose<CR>
"let NERDTreeMapOpenSplit = "S"


"============
"MarkdownPreview
"============
"============
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'google-chrome-stable'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''
" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

"==================
"C0C
"=================
"=================
let g:coc_global_extensions = ['coc-python','coc-xml','coc-explorer','coc-java','coc-snippets','coc-translator','coc-tsserver','coc-json','coc-pairs','coc-highlight','coc-emmet','coc-html','coc-css','coc-python','coc-clangd','coc-vimlsp']
" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

"补全切换TAB
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"打开补全
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-x> coc#refresh()

"确认补全项
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

"跳转可利用<C-o>返回

"报错跳转
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"函数相关跳转
" GoTo code navigation.
"跳转到函数定义
nmap <silent> gd <Plug>(coc-definition)
"跳转到类型定义
nmap <silent> gy <Plug>(coc-type-definition)
"
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" 显示文档
" Use K to show documentation in preview window.
nnoremap <silent> <c-k> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"同词高亮
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"重命名
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

"代码格式化
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>=  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>-  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')
set termguicolors

" coc-translator
nnoremap , :CocCommand translator.popup<CR>

" coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)


"===========
"===========
"coc-explorer
"===========
"===========
nmap tt : CocCommand explorer --preset normal<CR>




"===========
"===========
"snippet
"===========
"===========
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-h>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"===========
"===========
"vim-table-mode
"===========
"===========
map <Leader>m :TableModeToggle<CR>
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

"===========
"===========
"tarbar
"===========
"===========
nmap tb :TagbarToggle<CR>
let g:tagbar_map_showproto = '<C-h>'
let g:tagbar_map_togglecaseinsensitive = 'S'


"===========
"===========
"一键编译并运行
"===========
"===========

"下一个错误
nmap <leader>cn :cn<CR>
"上一个错误
nmap <leader>cp :cp<CR>
"错误列表
nmap <leader>cw :cw<CR>

"编译并运行
noremap <F5> :call Compile()<CR>
function! Compile()
  normal S
  "C++
  if &filetype == 'cpp'
    execute "make"
    let s:error_list_len = len(getqflist())
    if s:error_list_len == 0
      normal zk
      execute "te! time ./test"
    else
      execute "cw"
    endif
  "python3
  elseif &filetype == 'python'
    normal zk
    execute "te! python3.7 %"
  "markdown
  elseif &filetype == 'markdown'
    execute "MarkdownPreview"
  "java
  elseif &filetype == 'java'
    execute "make"
    let s:error_list_len = len(getqflist())
    if s:error_list_len == 0
      "主类名为Run.class
      normal zk
      execute "te! make run"
    else
      execute "cw"
    endif
  endif
endfunction

"===========
"===========
"gdb调试(C++)
"===========
"===========
noremap <F9> :call GdbDebug()<CR>
function! GdbDebug()
  normal S
  "C++
  if &filetype == 'cpp'
    execute "make gdb"
    let s:error_gdb_len = len(getqflist())
    if s:error_gdb_len == 0
      normal t0
      execute "te! gdb -q -tui ./gdbtest"
    else
      execute "cw"
    endif
  endif

endfunction

"===========
"===========
"一键注释
"===========
"===========
"<C-_>为<C-/>
noremap <C-_> :call Notes()<CR>
function! Notes()
  if &filetype == 'cpp'
    normal ^h//
  elseif &filetype == 'java'
    normal ^h//
  elseif &filetype == 'python'
    normal ^h#
  elseif &filetype == 'vim'
    normal ^h"
  endif
endfunction


"===========
"===========
"一键反注释
"===========
"===========
noremap <C-\> :call NotNotes()<CR>
function! NotNotes() 
  normal 0
  let s:cur_start = expand("<cWORD>")
  if &filetype == 'cpp'
    if s:cur_start =~ "//"
      normal 0dldl
    endif
  elseif &filetype == 'java'
    if s:cur_start =~ "//"
      normal 0dldl
    endif
  elseif &filetype == 'python'
    if s:cur_start =~ "#"
      normal 0dl
    endif
  elseif &filetype == 'vim'
    if s:cur_start =~ """
      normal 0dl
    endif
  endif
endfunction


"===========
"===========
"vim-autoformat
"===========
"===========
noremap <F3> :Autoformat<CR>

"path for format
"let g:formatterpath = ['~/.config/nvim/formatter/']

"当保存文件是自动格式化
au BufWrite *.cpp,*.js,*.java,*.py,*.c,*.h,*.html,*.css :Autoformat

"开启详细模式便于查错
"let g:autoformat_verbosemode=1 

"cpp&c
let g:formatdef_clangformat_google = '"clang-format -style google -"'
let g:formatters_c = ['clangformat_google']

let g:formatters_cpp = ['clangformat_google']

"java
let g:formatdef_astyleformat_java ='"astyle --style=java"'
let g:formatters_java = ['astyleformat_java']
