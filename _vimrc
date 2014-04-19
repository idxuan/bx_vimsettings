"-------------------------------------------------------------------------
" @Author  : Xuan Jun (idxuanjun@qq.com)
" @Link    : http://blog.csdn.net/idxuanjun
" @Date    : 2013-04-21
" @Version : 0.2.0
" @Desc    : VIM 默认配置文件
"-------------------------------------------------------------------------

" 是否OSX系统
function! IsOsx()
    return has('macunix')
endfunction
" 是否Unix/Linux系统
function! IsUnix()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
" 是否Windows系统
function! IsWindows()
    return  (has('win16') || has('win32') || has('win64'))
endfunction
" 是否Cygwin系统
function! IsCygwin()
    return  has('win32unix')
endfunction

" ！！！！！！！！！！！！！！！！ 注  意 ！！！！！！！！！！！！！！！！
"-------------------------------------------------------------------------
" 非特殊说明，配置文件中所有路径分割符字符采用 Unix 路径分隔符斜杠“/”描述，
" 而不是 Windows 路径分隔符反斜杠“\” 。
"-------------------------------------------------------------------------

" 转换 Windows 路径分割字符
function! ToSlash(pathstr)
    return tr(a:pathstr, '\', '/')
endfunction

" vimfiles 文件路径
if IsWindows()
    let g:vimfiles_path = fnameescape(ToSlash(expand('$VIM/vimfiles/')))
else
    let g:vimfiles_path = fnameescape(ToSlash(expand('$HOME/.vim/vimfiles/')))
endif

" Vim 运行时路径
if IsWindows()
    " 插件管理器 Vundle
    set runtimepath+=$VIM/vimfiles/bundle/vundle/
else
    " 插件管理器 Vundle
    set runtimepath+=$HOME/.vim/vimfiles/bundle/vundle/
endif

" 插件安装路径
let g:plugin_bundle_path = g:vimfiles_path . 'bundle/'

" 数据文件路径
let g:bx_vimdata_path = g:vimfiles_path . 'bx_data/'

" 配置文件路径
let g:bx_vimsettings_path = g:vimfiles_path . 'bx_vimsettings/'

" 调用配置文件
function! ExecuteGlobalSetting()
    let bx_global_file = g:bx_vimsettings_path . 'bx_global.vim'
    if filereadable(bx_global_file)
        exec 'source ' . bx_global_file
    endif
endfunction

call ExecuteGlobalSetting()
