#SingleInstance Force
#Include del循环删除企业微信用户_findTextClass_en.ahk               ;
#Include del循环删除企业微信用户_通用函数.ahk 

;转配地址：https://work.weixin.qq.com/wework_admin/frame#contacts 输入法英文 浏览器比例100%  根据网络情况调整 sleep

CoordMode, Mouse, Screen
MoveAndClick(x, y) {
    MouseMove, x, y
    Sleep, 200
    Click       ; 启用就 - 开启点击删除
}

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
        MoveAndClick(1696, 714) ;1 移动到 姓名框
        SendInput,^a
        phoneNumber := Trim(phoneNumberArray[A_Index])  ; 去除前后空格
        PersonInfo := StrSplit(phoneNumber, "-")
        SendInput, % Trim(PersonInfo[1]) ; 2 输入姓名
        SendInput, {Tab 2}
        Sleep, 300
        SendInput, % Trim(PersonInfo[2])    ; 3 账号
        SendInput, {Tab 2}
        Sleep, 100
        SendInput, % Trim(PersonInfo[3])    ; 4 手机  
        Sleep,200    
        MoveAndClick(1500, 590)
        Sleep,1000  
    }
    MsgBox, 4, 提示, 执行完毕！, 1
    ExitApp  
return

Esc::ExitApp