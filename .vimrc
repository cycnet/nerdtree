set nu
autocmd vimenter * NERDTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
     exec "w" 
     if &filetype == 'c' 
        exec "!g++ % -o %<"
        exec "! ./%<"
     elseif &filetype == 'cpp'
        exec ":! make"
     elseif &filetype == 'java'
        exec "!javac %" 
        exec "!java %<"
     elseif &filetype == 'sh'
           :!./%
     elseif &filetype = 'py'
        exec  "!python %"
        exec  "!python %<"
    endif 
endfunc

"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
   exec "w" 
   exec "!g++ % -g -o %<"
   exec "!gdb ./%<"
endfunc

