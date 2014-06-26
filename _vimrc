"======================================================================
"     FileName: _vimrc
"         Desc: VIM Ĭ�������ļ�
"       Author: Jun Xuan (idxuan@hotmail.com)
"         Link: http://idxuan.github.io
"      Version: 0.2.1
"   LastChange: 2014-04-30 20:25:54
"      History:
"======================================================================

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
" ������˵���������ļ�������·���ָ���ַ����� Windows/Unix ����ʶ���
" ·���ָ���б�ܡ�/�������������� Windows ·���ָ�����б�ܡ�\�� ��
"----------------------------------------------------------------------
" ת�� Windows ·���ָ��ַ�
" ����·��ת��ǰ����
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
let g:bx_data_path = g:vimfiles_path . 'bx_data/'

" �����ļ�·��
let g:bx_cache_path = g:vimfiles_path . 'bx_cache/'

" �����ļ�·��
let g:bx_settings_path = g:vimfiles_path . 'bx_settings/'

" �Զ�����ʱ�ļ�·��
let g:my_temp_path = 'd:/temp/'

" ���������ļ�
let bx_global_file = g:bx_settings_path . 'bx_global.vim'
if filereadable(bx_global_file)
    exec 'source ' . bx_global_file
endif
