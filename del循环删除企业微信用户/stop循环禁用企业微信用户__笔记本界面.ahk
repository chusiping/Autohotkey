#SingleInstance Force
#Include del循环删除企业微信用户_findTextClass_en.ahk              
#Include del循环删除企业微信用户_通用函数.ahk   

;转配地址：https://work.weixin.qq.com/wework_admin/frame#contacts 浏览器比例100%   sleep时间根据网络调整

CoordMode, Mouse, Screen
MoveAndClick(x, y) {
    MouseMove, x, y
    Sleep, 200
    Click       ; 启用就 - 开启点击删除
}

Gui, Add, Edit, w500 h300 vPhoneNumberInputMultiLine r10, 输入多行手机号 (每行一个)
Gui, Add, Button, default w100 gProcessNumbers, 处理
Gui, Show, Center, 批量删除企业微信用户
return

ProcessNumbers:
    Gui, Submit, Hide
    phoneNumberArray := StrSplit(PhoneNumberInputMultiLine, "`n")
    Sleep, 100
    Loop, % phoneNumberArray.MaxIndex()
    {
        Text_成员详情:="|<>*150$71.6E0000060UA0As3zzUsC30M0Mk6030kCC0lsk0A060k8M1UDzkM0A0bzz3U300zzs0DzyLj601zzk00M0hUA0301U00k1M0MM0003s1U2nwkkTzz0lzz5U9X0zzy1Xzy/3n610EA30A06DaM21UM60M0AN4k430kA0k0MyD0861UNzzslwQ0EA30nzzVX0kMUQ61U6037XkU1z03MA06DDl077U7kM0AMtq1s3kC0k0Mn1wzU1sM1U0lU0ls00k0301V8"
        
        phoneNumber := Trim(phoneNumberArray[A_Index])  ; 去除前后空格
        MoveAndClick(388, 300)                         ;移到输入框   
        Click 
        Sleep, 400      
        SendInput, ^a    
        Sleep, 200  
        SendInput, %phoneNumber%                        ;输入姓名或手机
        Sleep, 2000                                     ;匹配需要等页面载入，等时间算法再执行，这个时间太短是不行的
        ok_成员详情 := FindTextGeneral(Text_成员详情, 658, 311, 658, 311, X, Y)  ; 
  
        if (ok_成员详情)                                ;自动结果，如果找到返回按钮
        {
            Sleep, 300
            Text_禁用:="|<>*147$29.221zy44225yz448ss88GecTzt9AUV00112Tz224007zvzz88E40EEX9VUVNkm1T"
            ok_删除 := FindTextGeneral(Text_禁用, 741, 366, 741, 366, X, Y)
            if (ok_删除)                                ;自动结果，如果找到返回按钮
            {
                MoveAndClick(741, 364)                     ;！！！修改点 -   删除,等待确认框  
                Sleep,500
                MoveAndClick(1097, 490)                      ;找到按钮的坐标，点确认
                Sleep,200
            }
            else
            {
                MsgBox, 4, 提示, 无禁用选项, 1
                FileAppend, %phoneNumber%`n , nouser.txt
            }
        }
        else
        {
            FileAppend, %phoneNumber%`n , nouser.txt
            MsgBox, 4, 提示, 无用户, 1
        }
    }
    ExitApp
return

Esc::ExitApp