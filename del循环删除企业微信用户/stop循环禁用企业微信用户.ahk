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
        Text_成员详情:="|<>*140$105.00000000000000000000C40000000002020001lk0000000k1k0Q000C7U0zzzz0D0707U001kS07zzzs0s0Q1s000C1k0s00703U1kC0001k007000s0C0A3U3zzzzy0s00700s00s0Tzzzzk7000s06DzzzXzzzzy0s007001zzzwQ01k007zzzs0000s03U0C000zzzz0000700Q00k007000s0000s03U06000E0020TU0700Q00k70000003w00s03zy60s000000TUTzzsTzkkC0Tzzzy0A7zzz3zy71k3zzzzk1UzzzsQ1ksQ0Q000C0A00s03UC73U3U3U1k1U0700Q1kss0Q0Q0C0A00s03UC3703U3U1k1U0700Q1kNk0Q0Q0C0A00s03UC3w03U3U1k1VzzzyM1kTU0Q0Q0C0ATzzzn0C3s03U3U1k1Xzzzys1kC0sQ0S0C0A00s070A3k73U7w1k1U0700t3Uz0k81zs00AM0s06DwDs600SDs01b0700lz3nUk07UDk0Ds0s0600wSC07s0TU1w0700U0T1zk7y00z0T00s0403U7wTz001y3U07000080DVz0003k800s0000000C00004000300000000000000000004"
        
        
        phoneNumber := Trim(phoneNumberArray[A_Index])  ; 去除前后空格
        MoveAndClick(1001, 448)                         ;移到输入框   
        Click 
        Sleep, 400      
        SendInput, ^a    
        Sleep, 200  
        SendInput, %phoneNumber%                        ;输入姓名或手机
        Sleep, 2000                                     ;匹配需要等页面载入，等时间算法再执行，这个时间太短是不行的
        ok_成员详情 := FindTextGeneral(Text_成员详情, 1432, 451, 1432, 451, X, Y)  ; 
        ; if (!ok_成员详情){                            ;重要信息重复寻找
        ;     MsgBox, 4, 提示, 无用户再次等待2秒, 1
        ;     Sleep, 2500  
        ;     ok_成员详情 := FindTextGeneral(Text_成员详情, 1432, 451, 1432, 451, X, Y)  ; 
        ; }   
        if (ok_成员详情)                                ;自动结果，如果找到返回按钮
        {
            MoveAndClick(1580, 536)                     ;！！！修改点 -   删除,等待确认框  
            Sleep, 300
            Text_禁用:="|<>*188$50.zzXzxzszzzszyDyDy040DlzXzU003yDtzz73lzVyTzllsTwzbzws00zztzzC00DzyDzXtlm1zXzs2QQUTkzw0b7D7wDz2803lz3zUW00wTkTs8b7D7w7y29lnla8zsWQMwFWDy8U0D0llzW1lXkMQTs0QQwCDXy077D77wTXXlnnXz1zsw0zlzsTyT8TwzzC"
            ok_删除 := FindTextGeneral(Text_禁用, 2140, 830, 2140, 830, X, Y)

            MoveAndClick(2140, 830)                      ;找到按钮的坐标，点确认
            Sleep,200


            ; if (ok_删除)                                ;自动结果，如果找到返回按钮
            ; {
            ;     MoveAndClick(2140, 830)                      ;找到按钮的坐标，点确认
            ;     Sleep,200
            ; }
            ; else
            ; {
            ;     MsgBox, 4, 提示, 无确定按钮, 1
            ; }





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