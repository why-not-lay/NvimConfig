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
"auto fcitx
"===========
"===========
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * call Fcitx2en()
"进入插入模式
autocmd InsertEnter * call Fcitx2zh()

