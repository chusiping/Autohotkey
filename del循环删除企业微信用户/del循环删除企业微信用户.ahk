#Include del循环删除企业微信用户_findTextClass_en.ahk
#Include del循环删除企业微信用户_通用函数.ahk

MoveAndClick(x, y) {
    MouseMove, x, y
    Sleep, 1000
    Click
}

^!+p::
    Gui, Add, Edit, w500 h300 r10 vPhoneNumberInputMultiLine, 输入多行手机号 (每行一个)
    Gui, Add, Button, default w100 gProcessNumbers, 处理
    Gui, Show, Center, Phone Number Input
    
return

ProcessNumbers:
    Gui, Submit, Hide
    phoneNumberArray := StrSplit(PhoneNumberInputMultiLine, "`n")
    Sleep, 100
    Loop, % phoneNumberArray.MaxIndex()
    {
        phoneNumberVar := "PhoneNumberInput" A_Index
        phoneNumber := Trim(phoneNumberArray[A_Index])  ; 去除前后空格
        MoveAndClick(1001, 448)                         ;移到输入框 
        Click 
        Sleep, 200      
        SendInput, ^a    
        Sleep, 200  
        SendInput, %phoneNumber%                        ;输入姓名或手机
        Sleep, 1200                                     ;匹配需要等页面载入，等时间算法
        if (FindTextGeneral(Text_成员详情, 1412, 453, 1412, 453, X, Y))    ;自动结果，如果找到返回按钮
        {
            MoveAndClick(1708, 547)                     ;点删除   
            MoveAndClick(2090, 940)                     ;点确认
        }
        else
        {
            MsgBox, 4, 提示, 无用户, 1
        }
    }
    ExitApp  
return
Esc::Reload