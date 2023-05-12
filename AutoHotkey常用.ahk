#SingleInstance Force
#Include E:\____dropbox__Sync\Dropbox\配置文件中转站\AutoHotkey\AutoHotkey菜单.ahk

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

^1::
	send ^c
	Sleep 50
    thisvar := clipboard
    thisvar := "<font color='red' size=''>" . thisvar . "</font>"
    clipboard := thisvar
    send ^v
	return


;;===========  chrome.exe	==============
#IfWinActive, ahk_exe chrome.exe

;===========  youtube快捷快退	==============
	2::
		WinGetTitle, title, A
		If InStr(title,"YouTube")
			send , {right 2}
		else
			send , 2
		return
	return
	1::
		If InStr(title,"YouTube")
			send , {left 2}
		else
			send , 1
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

;;===========  potplayer 	==============
#IfWinActive, ahk_exe hexin.exe
	2::
		send , {Up}
	return
	1::
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


:*:/con::console.log('▶'){left 1}
:*:/find::find / -name master
:*:/kill::kill -9 xxx
:*:/ll::ll -lh -t
:*:/release::cat /etc/redhat-release
:*:/mem::free -m
:*:/rm::rm -f *  rm -rf xx @删除文件夹子
;:*:/in::echo $STY{enter}   ;[是否在screen里]


:*:/ali::
	send, alias fuwu='netstat -ntlp'	 {enter}
	send, alias ps1='ps -ef | grep http' {enter}
	send, alias cls='clear'{enter}'
	send, alias net='netstat -ntlp | sort'{enter}
	send, alias port='netstat -aultnp | grep 80' {enter}
	send, alias sc='screen -ls' {enter}
	send, alias sc-r='screen -r' {enter}
	send, alias dk='firewall-cmd --list-ports' {enter}
	send, alias ps2='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}"  -a' {enter}
	sendraw, alias net2='netstat -ntlp  | awk -F '[1234567890]/'  '$2 !~ /Program name|zerotier-one/ {print $1,$2}' OFS="\t" | sort -k8,8r' {enter}
	return





















