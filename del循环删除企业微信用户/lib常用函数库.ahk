#Persistent
#SingleInstance Force

MsgBox, 定位到开始页面准备开始,Esc随时取消


;1 #################################################################
ShowToolTip(Text, X := "", Y := "", TipTitle := "", HiddenTime := "")
{
    ToolTip, %Text%, %X%, %Y%, %TipTitle%, %HiddenTime%
    Sleep, %HiddenTime%  ; 如果指定了隐藏时间，则暂停相应的时间
    ToolTip  ; 隐藏工具提示
    MsgBox, 4, 提示, 操作失败！, 1
}
ShowToolTip("这是一个示例工具提示", "", "", "", 2000)


;2 #################################################################
Gui, Add, Edit, w500 h300 vPhoneNumberInputMultiLine r10, 每个成员一行多个属性逗号隔开
GuiControl,, PhoneNumberInputMultiLine, 杨佩琪-yangpeiqi-19112692274`n李靖韵-lijingyun-18926106832 
Gui, Add, Button, default w100 gProcessNumbers, 处理
Gui, Show, Center, Phone Number Input
return
ProcessNumbers:
    Gui, Submit, Hide
    phoneNumberArray := StrSplit(PhoneNumberInputMultiLine, "`n")
    Sleep, 200
    Loop, % phoneNumberArray.MaxIndex()
    {
        phoneNumber := Trim(phoneNumberArray[A_Index])  ; 去除前后空格
        PersonInfo := StrSplit(phoneNumber, "-")
        MsgBox, 4, 提示  , % Trim(PersonInfo[1]) Trim(PersonInfo[2])  Trim(PersonInfo[3]),1
    }
    MsgBox, 4, 提示, 执行完毕！, 1
    ExitApp  
return

;#################################################################
Esc::ExitApp