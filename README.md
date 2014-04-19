To CSDN Blog
============

-------------------------------------------------------------------------------

* @Author  : Xuan Jun (idxuanjun@qq.com)
* @Link    : http://blog.csdn.net/idxuanjun
* @Date    : 2013-11-23
* @Version : 0.0.1
* @Desc    : 转换Sublime Text 3 的“Markdown Preview”插件生成的HTML格式至CSDN博客。

-------------------------------------------------------------------------------

说明
------------------
因为我是用Markdown写的CSDN博客，但“Markdown Preview”插件生成的HTML代码段与CSDN博客支持的格式不一致，所以自己写了个插件转换一下。

####没有仔细研究Sublime Text的语法，找了个例子随便改改凑合用的，没经过优化，欢迎大家更新修改。

[To CSDN Blog](https://github.com/idxuanjun/ToCsdnBlog)

注意
----
To CSDN Blog 只在 Sublime Text 3 中测试使用过，不保证 Sublime Text 2 正常使用。

安装
----
请将本项目打包下载，如果下载的是压缩文件需要解压缩，将文件夹名修改为 *ToCsdnBlog* ，然后将此文件夹移动到 Sublime Text 的 *Packages* 文件夹下（可通过 Sublime Text 菜单中的 Preferences > Browse Packages 找到 *Packages* 文件夹）。


使用说明
--------

###使用命令面板
1. 按下快捷键 `Ctrl+Shift+P` 调出命令面板，输入`“Markdown Preview:Python Markdown:Export HTML in Sublime Text”`生成HTML格式博客内容；
2. 按下快捷键 `Ctrl+Shift+P` 调出命令面板，输入`“To CSDN Blog”`将HTML格式博客内容转换CSDN博客支持的格式。

###使用快捷键
1. 按下快捷键 `Ctrl+Shift+P` 调出命令面板，输入`“Markdown Preview:Python Markdown:Export HTML in Sublime Text”`生成HTML格式博客内容；
2. 按下快捷键 `Alt+;,Alt+B` 将HTML格式博客内容转换CSDN博客支持的格式。
