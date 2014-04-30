"======================================================================
"     FileName: bx_developer.vim
"         Desc: VIM 研发相关
"       Author: Xuan Jun (idxuanjun@qq.com)
"         Link: http://idxuanjun.github.io
"      Version: 0.2.1
"   LastChange: 2014-04-30 20:26:45
"      History:
"======================================================================

"----------------------------------------------------------------------
" 研发全局设置
"----------------------------------------------------------------------
" 开启折叠，设置折叠模式
if exists("&foldenable")
    set foldmethod=indent
    set nofoldenable
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
    augroup bx_dev_golang
        autocmd!
        autocmd BufNewFile,BufRead *.go set filetype=go
        autocmd FileType go compiler go
        "autocmd FileType go autocmd BufWritePre <buffer> Fmt
        autocmd BufWritePost *.go call system("ctags -R")
    augroup end
endif

if has("autocmd")
    augroup bx_dev_python
        autocmd!
        autocmd FileType python set omnifunc=python3complete#Complete
        autocmd BufWritePost *.py,*.pyw call system("ctags -R")
    augroup end
endif

if has("autocmd")
    augroup bx_dev_web
        autocmd!
        autocmd FileType html   set omnifunc=htmlcomplete#CompleteTags
        autocmd FileType xml    set omnifunc=xmlcomplete#CompleteTags
        autocmd FileType css    set omnifunc=csscomplete#CompleteCSS
        autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
        autocmd BufWritePost *.htm,*.html,*.xml,*.css,*.js call system("ctags -R")
    augroup end
endif

if has("autocmd")
    augroup bx_developer
        autocmd!
        " 不知道是哪个插件设置 buftype=nofile，影响 ctags 使用，恢复默认
        autocmd VimEnter * set buftype=""

        "autocmd FileType php    set omnifunc=phpcomplete#CompletePHP
        "autocmd BufWritePost *.php call system("ctags -R")
    augroup end
endif

"----------------------------------------------------------------------
" 快捷设置
"----------------------------------------------------------------------
nnoremap <F12> :!ctags -R<CR>

" 当打开的文档中含有多种语言的时候,单一使用某一种文件类型的高亮
" 方式必然会非常难看,比如说一个介绍J2EE的文件,里面必然有Java的代
" 码,也会存在很多XML的代码,这个时候需要随时切换不同的高亮方案
"nnoremap <Leader>1 :set syntax=java<CR>
"nnoremap <Leader>2 :set syntax=c<CR>
"nnoremap <Leader>3 :set syntax=xhtml<CR>
"nnoremap <Leader>4 :set syntax=python<CR>
"nnoremap <Leader>5 :set ft=javascript<CR>
"nnoremap <Leader>0 :syntax sync fromstart<CR>

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

" 编译 Markdown 代码，需要 markdown_py 支持
function! CompileMarkdown()
    let htmfn = g:bx_cache_path . expand('%:t:r') . '.htm'
    let headmsg = '<meta http-equiv="content-type" content="text/html; charset=utf-8">'
    execute EncToChs('!markdown_py.bat -e utf-8 -o xhtml1 ' . expand('%') . ' -f ' . htmfn)
    let flist = readfile(htmfn)
    call insert(flist, headmsg)
    call writefile(flist, htmfn)
endfunc

" 运行 Markdown 代码，需要 markdown_py 支持
function! RunMarkdown()
    let htmfn = g:bx_cache_path . expand('%:t:r') . '.htm'
    if !filereadable(htmfn)
        call CompileMarkdown()
    endif
    execute EncToChs('!start cmd.exe /c ' . htmfn)
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
    elseif &filetype == "mkd"
        call CompileMarkdown()
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
    elseif &filetype == "mkd"
        call RunMarkdown()
    endif
endfunc

" <F6> 运行
map <F6> :call RunResult()<CR>
imap <F6> <ESC>:call RunResult()<CR>a
vmap <F6> <ESC>:call RunResult()<CR>
" <S-F6> 编译
map <S-F6> :call CompileCode()<CR>
imap <S-F6> <ESC>:call CompileCode()<CR>a
vmap <S-F6> <ESC>:call CompileCode()<CR>
