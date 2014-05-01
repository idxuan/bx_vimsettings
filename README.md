>======================================================================
>     FileName: README.md
>         Desc: Vim 配置文档
>       Author: Xuan Jun (idxuanjun@qq.com)
>         Link: http://idxuanjun.github.io
>   LastChange: 2014-04-30 20:28:20
>      History:
>======================================================================

Vim 配置文档
============

说明
----

自己的 Vim 配置文档，做个备份，喜欢的朋友也可以拿去修改使用。

安装
----

请将本项目打包下载，目录“bx_vimsettings”放在“vimfiles”目录下，文件“_vimrc”是主配置文件，可以移出替换你的 Vim 配置文件。如果你的路径与我的不一致，可以修改“_vimrc”主配置文件中路径以符合你的路径。

Vim 输入法
----------

吐槽一下，Vim 对非字母输入的用户来说太糟心了，让行云流水的输入变得磕磕碰碰的异常难受。曾经停用了两次 Vim 的使用，又舍不得捡了回来，输入法是停用最大的原因，很有些鸡肋的感觉。就算你的英文好也麻烦的很，总不能你写的都是代码和英文文档吧。不管如何，在我的周围里需要使用中文的机会太多了……

受到 VimIM 和 VimIM-wubi 的启发，最近在码能在 Vim 里使用的输入法，直接用 vim-script 编写。我是用“小鹤双拼输入法”的，VimIM 太麻烦，什么云输入之类的不适合我，作者又很长时间不更新了，有些小 BUG 因为功能太繁杂修改起来也较麻烦，想着干脆自己改个适合自己的，哈哈，自己动手，丰衣足食嘛。以字词输入为重点，类似五笔输入，不考虑联想，用字典方式为主体架构，简单来说，就是输入字母，查找字典输出，输出什么都可以自己定义。

我已经放在[Github](https://github.com/idxuanjun/bx_vimim_dict) 给大家共享，如果有同样需求的可以试用，欢迎多提宝贵意见哈：）
