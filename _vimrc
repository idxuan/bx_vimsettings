"----------------------------------------------------------------------
" @Author  : Xuan Jun (idxuanjun@qq.com)
" @Link    : http://blog.csdn.net/idxuanjun
" @Date    : 2013-04-21
" @Version : 0.2.0
" @Desc    : VIM Ĭ�������ļ�
"----------------------------------------------------------------------

" �Ƿ�OSXϵͳ
function! IsOsx()
    return has('macunix')
endfunction
" �Ƿ�Unix/Linuxϵͳ
function! IsUnix()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
" �Ƿ�Windowsϵͳ
function! IsWindows()
    return  (has('win16') || has('win32') || has('win64'))
endfunction
" �Ƿ�Cygwinϵͳ
function! IsCygwin()
    return  has('win32unix')
endfunction

" ������������������������������ ע  �� ������������������������������
"----------------------------------------------------------------------
" ������˵���������ļ�������·���ָ���ַ����� Unix ·��
" �ָ���б�ܡ�/�������������� Windows ·���ָ�����б�ܡ�\�� ��
"----------------------------------------------------------------------

" ת�� Windows ·���ָ��ַ�
function! ToSlash(pathstr)
    return tr(a:pathstr, '\', '/')
endfunction

" vimfiles �ļ�·��
if IsWindows()
    let g:vimfiles_path = fnameescape(ToSlash(expand('$VIM/vimfiles/')))
else
    let g:vimfiles_path = fnameescape(ToSlash(expand('$HOME/.vim/vimfiles/')))
endif

" Vim ����ʱ·��
if IsWindows()
    " ��������� Vundle
    set runtimepath+=$VIM/vimfiles/bundle/vundle/
else
    " ��������� Vundle
    set runtimepath+=$HOME/.vim/vimfiles/bundle/vundle/
endif

" �����װ·��
let g:plugin_bundle_path = g:vimfiles_path . 'bundle/'

" �����ļ�·��
let g:bx_vimdata_path = g:vimfiles_path . 'bx_data/'

" �����ļ�·��
let g:bx_vimsettings_path = g:vimfiles_path . 'bx_vimsettings/'

" ���������ļ�
function! ExecuteGlobalSetting()
    let bx_global_file = g:bx_vimsettings_path . 'bx_global.vim'
    if filereadable(bx_global_file)
        exec 'source ' . bx_global_file
    endif
endfunction

call ExecuteGlobalSetting()
