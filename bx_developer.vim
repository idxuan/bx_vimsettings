"----------------------------------------------------------------------
" @Author  : Xuan Jun (idxuanjun@qq.com)
" @Link    : http://blog.csdn.net/idxuanjun
" @Date    : 2013-04-21
" @Version : 0.2.0
" @Desc    : VIM 研发相关
"----------------------------------------------------------------------

"----------------------------------------------------------------------
" 研发全局设置
"----------------------------------------------------------------------
" 开启折叠，设置折叠模式
if exists("&foldenable")
    set nofoldenable
    set foldmethod=indent
endif
" 设置代码折叠级别
if exists("&foldlevel")
    set foldlevel=0
endif

" 指定插入模式用 CTRL-X CTRL-O 进行全能 (omni) 补全使用的函数
set omnifunc=syntaxcomplete#Complete
" 逗号分隔的选项列表，用于插入模式的补全
set completeopt=menuone,longest
" 预览窗口的缺省高度
set previewheight=10

" 列高亮提示
"set colorcolumn=72
" 按下<Leader>,ch 就可以将当前光标下的列高亮，
" 再按下一次，取消高亮；并且可以同时多列高亮
nnoremap <silent><Leader>,ch :call SetColorColumn()<CR>
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&colorcolumn, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set colorcolumn+=".col_num
    else
        execute "set colorcolumn-=".col_num
    endif
endfunction
"----------------------------------------------------------------------
" AutoCmd Group bx_developer
"----------------------------------------------------------------------
if has("autocmd")
    augroup bx_developer
        autocmd!

        autocmd BufNewFile,BufRead *.go set filetype=go
        "autocmd BufNewFile,BufRead *.py *.pyw set filetype=python3
        " 补全
        "autocmd FileType php    set omnifunc=phpcomplete#CompletePHP
        "autocmd FileType python set omnifunc=pythoncomplete#Complete
        autocmd FileType python set omnifunc=python3complete#Complete
        autocmd FileType c      set omnifunc=ccomplete#Complete
        autocmd FileType html   set omnifunc=htmlcomplete#CompleteTags
        autocmd FileType xml    set omnifunc=xmlcomplete#CompleteTags
        autocmd FileType css    set omnifunc=csscomplete#CompleteCSS
        autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

        "autocmd FileType go autocmd BufWritePre <buffer> Fmt
        autocmd FileType go compiler go
    augroup end
endif

"----------------------------------------------------------------------
" 格式化、语法、编译、运行
"----------------------------------------------------------------------
" 编译 C
function! CompileGcc()
    execute "w"
    let compilecmd="!gcc "
    let compileflag="-o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpicc "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    execute compilecmd." % ".compileflag
endfunc

" 编译 C++
function! CompileGpp()
    execute "w"
    let compilecmd="!g++ "
    let compileflag="-o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpic++ "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    execute compilecmd." % ".compileflag
endfunc

" 编译 Java 代码
function! CompileJava()
    execute "!javac %"
endfunc
"
" 运行 mpi
function! RunMpi()
    execute "!mpirun -np 4 ./%<"
endfunc

" 运行 C 代码
function! RunGcc()
    execute "! ./%<"
endfunc

" 运行 C++ 代码
function! RunGpp()
    execute "! ./%<"
endfunc

" 运行 Java 代码
function! RunJava()
    execute "!java %<"
endfunc

" 运行 Python 代码
function! RunPython()
    execute "!python %"
endfunc

" 编译
function! CompileCode()
    execute "w"
    if &filetype == "cpp"
        call CompileGpp()
    elseif &filetype == "c"
        call CompileGcc()
    elseif &filetype == "java"
        call CompileJava()
    elseif &filetype == "python"
        call RunPython()
    endif
endfunc

" 运行
function! RunResult()
    execute "w"
    if search("mpi\.h") != 0
        call RunMpi()
    elseif &filetype == "cpp"
        call RunGpp()
    elseif &filetype == "c"
        call RunGcc()
    elseif &filetype == "java"
        call RunJava()
    elseif &filetype == "python"
        call RunPython()
    endif
endfunc

" <F5> 编译
map <F5> :call CompileCode()<CR>
imap <F5> <ESC>:call CompileCode()<CR>a
vmap <F5> <ESC>:call CompileCode()<CR>
" <F6> 运行
map <F6> :call RunResult()<CR>
imap <F6> <ESC>:call RunResult()<CR>a
vmap <F6> <ESC>:call RunResult()<CR>


