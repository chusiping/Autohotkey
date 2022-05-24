#SingleInstance Force

;===========  定时器	==============
^F12::
InputBox, time, 计时器, 请输入计时分钟数,,180,130,,,,,2
InputBox, msg, 计时器, 输入提示信息,,180,130,,,,,2
if ErrorLevel
return
else
time := time*60000
Sleep,%time%
SoundBeep, 250, 100
Sleep,50
SoundBeep, 250, 100
Sleep,50
SoundBeep, 250, 500
MsgBox %msg%
return



;===========  `键 在浏览器，word下不同作用	==============
#IfWinActive, ahk_exe chrome.exe
`::	send ,^w
#IfWinActive

#IfWinActive, ahk_exe WINWORD.EXE
`::	send , {delete}
Esc::send ,{backspace}
#IfWinActive

#IfWinActive, ahk_exe vlc.EXE
Esc::send ,^q
#IfWinActive

;===========  F3 F4 F1 	==============
$CapsLock::Enter	
$F3::Backspace
$F4::Delete
$F1::^v
LALT & Capslock::SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"

;###### 右键双击，中间粘贴 ########	
gnPressCount := 0
$F9::
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
        If gnPressCount = 1
        {
                Send {Click right}
        }Else If gnPressCount = 2
        {
                send ^c
                
        }
        gnPressCount := 0
        Return
}
$MButton::
{
     send ^v`
     Return
}


;################################## alt 1,2,3 快速搜索区域 ##############################

!1:: ;win+1 -> 用google搜索剪切板的内容
send,^c
run "C:\Users\Administrator\AppData\Local\CentBrowser\Application\chrome.exe" https://www.google.com/search?q=%clipboard%
sleep 1000
tooltip,
return


!2:: ;win+2 -> 搜索股票信息
send,^c
code := to_code2(clipboard)
;输出(code)
run "C:\Users\Administrator\AppData\Local\CentBrowser\Application\chrome.exe" http://quote.eastmoney.com/%code%.html
sleep 1000
tooltip,
return

!3:: ;win+2 -> 搜索股票咨询
send,^c
run "C:\Users\Administrator\AppData\Local\CentBrowser\Application\chrome.exe" www.google.com/search?q=%clipboard%`%20site:caifuhao.eastmoney.com
sleep 1000
tooltip,
return


;自定义函数
to_code2(x)
{
        rt := "000001" 
        Loop, read, E:\____dropbox__Sync\Dropbox\配置文件中转站\AutoHotkey\stock.txt
        {
                Loop, parse, A_LoopReadLine, %A_Tab%
                {
                        if(InStr(A_LoopField,x) > 0 )
                        {
                                rt2 := StrSplit(A_LoopField,"_")
                                rt := rt2[2]
                                break
                        }
                }
        }
        return rt
}
;自定义函数
输出(内容){
        if(WinExist("ahk_class ConsoleWindowClass")=0)
        {
                Run,cmd.exe
                sleep 500
        }
        ControlSend,,::%内容%`r,ahk_class ConsoleWindowClass
}
