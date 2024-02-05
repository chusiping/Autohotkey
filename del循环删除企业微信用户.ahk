#Persistent

MoveAndClick(x, y, clickTimes := 1) {
    MouseMove, x, y
    Sleep, 1000
    Loop, %clickTimes% {
        Click
    }
    Sleep, 200
}

^!+p::
Gui, Add, Edit, w500 h300 vPhoneNumberInputMultiLine r10, 输入多行手机号 (每行一个)
Gui, Add, Button, default w100 gProcessNumbers, 处理
Gui, Show, Center, Phone Number Input

return

ProcessNumbers:
    Gui, Submit, NoHide
    phoneNumberArray := StrSplit(PhoneNumberInputMultiLine, "`n")
    Gui, Destroy
    Sleep, 900
    Loop, % phoneNumberArray.MaxIndex()
    {
        phoneNumber := Trim(phoneNumberArray[A_Index]) ; 去除前后空格
        MoveAndClick(1001, 448, 2)
        Click
        SendInput, %phoneNumber%              ;搜索
        MoveAndClick(1708, 547, 1)             ;删除
        MoveAndClick(2090, 940, 1)             ;确认
    }
return

Esc::Reload