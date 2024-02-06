#SingleInstance Force
#Include E:\____dropbox__Sync\Dropbox\配置文件中转站\AutoHotkey\AutoHotkey菜单.ahk


^+d::
	send ^a
	sleep 50
	send {Backspace}
	sleep 50
	send ^v
return

^!r::
	run cmd
	sleep 500
	send, cd "E:\git_15home\vue_cli\vue-template-jijian"{enter}
	send, npm run serve{enter}
	send, cd "E:\git_15home\前端_vue_react等\vue-demo-onebyone\vue-template-jijian\"{enter}
	send, npm run serve{enter}

return


;===========  ctrl+Alt+/ : nodejs块注释	==============
^!/::
    send ^c
    thisvar := clipboard
    thisvar := "/*`n" . thisvar . "`n*/"
    clipboard := thisvar
    send ^v
return


;===========  空格	==============
	^+SPACE::send,　　

;===========  任务管理器	==============
	^!m::
		run_taskmgr()
	return

;;===========  cmd，xshell	==============
#IfWinActive, ahk_exe ConEmu64.exe
`::
	Send, {Up}
	Return
·::
	Send, {Up}
	Return
#IfWinActive

#IfWinActive, ahk_exe MobaXterm.exe
`::
	Send, {Up}
	Return
·::
	Send, {Up}
	Return
#IfWinActive

;;===========  JPEGView.exe	==============
#IfWinActive, ahk_exe JPEGView.exe
$up::send,{WheelUp}
$down::send,{WheelDown}
$space::
{
   send,{right}
}
return
`::
send , {delete}
Sleep,100
send,{enter}
return
#IfWinActive

;^1::
;	send ^c
;	Sleep 50
;    thisvar := clipboard
;    thisvar := "<font color='red' size=''>" . thisvar . "</font>"
;    clipboard := thisvar
;    send ^v
;	return



;;===========  chrome.exe	==============
#IfWinActive, ahk_exe chrome.exe

;===========  youtube快捷快退	==============
	2::
		WinGetTitle, title, A
		If (InStr(title,"YouTube") or InStr(title,"bilibili"))
			send , {right 1}
		else
			send , 2
		return
	return
	1::
		WinGetTitle, title, A
		If (InStr(title,"YouTube") or InStr(title,"bilibili"))
			send , {left 1}
		else
			send , 1
		return
	return
	$Down::
		WinGetTitle, title, A
		If (InStr(title,"YouTube") or InStr(title,"bilibili"))
			Send {Space}
		else
			Send {Down}
		return
	return

;===========  西瓜网WheelUp	==============
	!WheelUp::
		WinGetTitle, title, A
		If InStr(title,"西瓜视频")
			send , {right}　　
		else
			send , {ctrl}+{WheelUp}
		return
	return
	!WheelDown::
		WinGetTitle, title, A
		If InStr(title,"西瓜视频")
			send , {left}　　
		else
			send , {ctrl}+{WheelDown}
		return
	return
#IfWinActive


;;===========  potplayer 	==============
#IfWinActive, ahk_class PotPlayer
	2::
		send , {right}
	return
	1::
		send , {left}
	return
#IfWinActive

;;===========  vlc 	==============
#IfWinActive, ahk_exe vlc.exe
	$down::
		send , {Space}
	return
#IfWinActive

;;===========  potplayer 	==============
#IfWinActive, ahk_exe hexin.exe
	2::
		send , {Up}
	return
	$Space::
		send , {Down}
	return
#IfWinActive


;################银河证券交易############
^!j::
run "D:\海王星金融终端-中国银河证券\xiadan\xiadan.exe"
sleep 4000
send,761110
return


;################ 热子串 命令行区域all ############
:*:/gp:: ssh root@redis.qy{enter}cd /root/NodeJsApp/zhhw-nodejs && node gpszl_股票上涨率.js{enter}node gpszl_股票上涨率.js
return






;===时间
:*:/sj::
FormatTime, CurrentDateTime,, yyyy-M-d H:mm
SendInput %CurrentDateTime%
return

;===时间
:*:/rq::
FormatTime, CurrentDateTime,, yyyy-M-d
SendInput %CurrentDateTime%_
return

;################ navicat mysql ############
#IfWinActive, ahk_exe navicat.exe
	^w::
		send,^/
		return
	^+w::
		send,^+/
		return
#IfWinActive



;################ sublime专门设定 ############
#IfWinActive, ahk_exe sublime_text.exe
	`::
	send,^w
	return
#IfWinActive


;################ vs code专门设定 ############
#IfWinActive, ahk_exe Code.exe
	^w::
	send,^/
	return
#IfWinActive

;################ cursor专门设定 ############
#IfWinActive, ahk_exe Cursor.exe
	^w::
	send,^/
	return
#IfWinActive

;################ markdown ############
#IfWinActive, ahk_exe Typora.exe
	^w::
	send,^+k
	return
#IfWinActive

;################ windows相片看视频 ############
;#IfWinActive, ahk_exe ApplicationFrameHost.exe
;	$RButton::
;	{
;		send {space}
;	}
;#IfWinActive


;-::_
;################ 快速给文件名加前缀 ############
#IfWinActive, ahk_exe Explorer.EXE
	-::_
	^$F2::
	send,{f2}{left}^v_{enter}
	return
#IfWinActive

;################ color wolf专门设定 ############
#IfWinActive, ahk_exe ColorWolf.exe
gnPressCount := 0
$RButton::
{
        gnPressCount += 1
        SetTimer, ProcSubroutine, Off
        SetTimer, ProcSubroutine, 300
        Return
}
ProcSubroutine:
{
        ; 在计时器事件触发时，需要将其关掉
        SetTimer, ProcSubroutine, Off
        If gnPressCount = 2
        {
            send {delete}
        }
        gnPressCount := 0
        Return
}
#IfWinActive


:*:..con::console.log('▶'){left 1}
:*:/find::find / -name master
:*:..kill::kill -9 xxx
:*:..ll::ll -lh -t
:*:..re::cat /etc/redhat-release
:*:/mem::free -m
:*:/rm::rm -f *  rm -rf xx @删除文件夹子
;:*:/in::echo $STY{enter}   ;[是否在screen里]

::..ssh::
Run, cmd.exe
WinWaitActive, ahk_exe cmd.exe
Send, ssh root@121.4.43.207{Enter}
return

;linxu命令常用(还是要加一个不然效率太低2023-6-1)
:*:..save::
	ReadText("ahk_readtxt\linxu命令常用.txt",1)
	return
:*:..load::
	ReadText("ahk_readtxt\linxu命令常用.txt",2)
	return
:*:..tag::
	ReadText("ahk_readtxt\linxu命令常用.txt",3)
	return
:*:..run::
	ReadText("ahk_readtxt\linxu命令常用.txt",4)
	return
:*:..comm::
	ReadText("ahk_readtxt\linxu命令常用.txt",5)
	return
:*:..copy::
	ReadText("ahk_readtxt\linxu命令常用.txt",6)
	return
:*:..cat::
	ReadText("ahk_readtxt\linxu命令常用.txt",7)
	return
:*:..rm::
	ReadText("ahk_readtxt\linxu命令常用.txt",8)
	return
:*:..ip::
	ReadText("ahk_readtxt\linxu命令常用.txt",9)
	return
:*:..addr::
	ReadText("ahk_readtxt\配置centos的ip.txt",0)
	return
:*:..ali::
	ReadText("ahk_readtxt\alias别名.txt",0)
	return
:*:..yao::
	ReadText("E:\____dropbox__Sync\Dropbox\temp\碎片\药方.txt",0)
	return


ReadText(_path,idx)
{
    Loop, read, %_path%
    {
        row=% A_Index
        Loop, parse, A_LoopReadLine, %A_Tab%
        {
			;rt=%rt%`n%A_LoopField%
            if (row=idx)            {
                Sendraw, %A_LoopField%
                return
            }
            if (idx=0){
                Sendraw, %A_LoopField%`n
            }
        }
    }
}


















