﻿#SingleInstance Force
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
        Text_成员详情:="|<>*136$68.7zzzzw1k00C1zzzzz0Q003UQ01k007zzzs700Q001zzzy1k03000Q003UQ00k0000000700A1k000001zz30Q000000TzkkC0Tzzzy7zwC3U7zzzzVk73Vk1k000sQ1ksQ0Q0Q0C70QCC070703Vk71XU1k1k0sQ1kNk0Q0Q0C70Q7s070703VU71y01k1k0sM1kD00Q0Q0CC0Q3UC70703XU61s3Vk3y0ss3Uz0k01zs0ATsTkA00wTk77wDC300S0z1k07Xlk0z03ws07kTw1zU0Ds"
        
        
        phoneNumber := Trim(phoneNumberArray[A_Index])  ; 去除前后空格
        MoveAndClick(1001, 448)                         ;移到输入框 
        Click 
        Sleep, 200      
        SendInput, ^a    
        Sleep, 200  
        SendInput, %phoneNumber%                        ;输入姓名或手机
        Sleep, 1200                                     ;匹配需要等页面载入，等时间算法再执行
        ok_成员详情 := FindTextGeneral(Text_成员详情, 1412, 453, 1412, 453, X, Y)  ;
        if (ok_成员详情)                                ;自动结果，如果找到返回按钮
        {
            MoveAndClick(1708, 547)                     ;点删除,等待确认框  
            Sleep, 200
            Text_删除:="|<>*179$49.zzzszzwzw21wM1wTy10mA0w7zAaN6Aw1zaHAX4S8Tn9aFWCC7tYn8lADVwmNYM4DsCNAmA0007AaN6100K000X4zXz000FWDlztYn8lbszwmNYMk00SNAmAM00DAaN6AT7zaHAX0NWTX9aFU8l7lYnskQsltkNwMwQQQUAyAQSD400M6DM7zTYQ77w7z"
            ok_删除 := FindTextGeneral(Text_删除, 2091, 974, 2091, 974, X, Y)
            if (ok_删除)                                ;自动结果，如果找到返回按钮
            {
                MoveAndClick(X, Y)                      ;找到按钮的坐标，点确认
                Sleep,200
            }
            else
            {
                MsgBox, 4, 提示, 无删除按钮, 1
            }
        }
        else
        {
            MsgBox, 4, 提示, 无用户, 1
        }
    }
    ExitApp
return

Esc::ExitApp