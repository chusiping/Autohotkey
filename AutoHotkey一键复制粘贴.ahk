; 选中文件复制/移动至备份文件夹
esc::
clipboard :=""
备份文件夹 = E:\迅雷下载\temp\
send ^c
clipwait,2
选中文件 :=clipboard
Loop, parse, clipboard, `n, `r
{
	RegExMatch(A_LoopField,".*\\(.+?\..*)$",文件名)
    RegExMatch(A_LoopField,"(.*\\).+?\..*$",原始路径)
    FileMove, %A_LoopField%, % 备份文件夹
}
return
