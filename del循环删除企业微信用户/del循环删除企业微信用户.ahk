#Include findtextclass.ahk

;###################### 查找返回按钮 ###########################
t1:=A_TickCount, Text:=X:=Y:=""
Text:="|<>*172$73.0000000000000000303zXzzz00000kzzlzzzU0000QM00k00k00006A00M00M0MM03600A00A0MM0030060060MM001zz37zX0MM03kk1VX0lUMM01sM1klUMkMM00ADUkMkAMMM0064ssAM6AAA0036CM6A3633001X1s361X0kk00lUw1XzlUAA00NUz0lzsk31U0AktkMkAM0ks06lsQA00A0A4033k7600600003kU0300300003C001zzzU00013zzsk00k00000000M00N"
FindText(ByRef x:="FindTextClass", ByRef y:="", args*)
{
  global FindTextClass
  if (x=="FindTextClass")
    return FindTextClass
  else
    return FindTextClass.FindText(x, y, args*)
}
;逻辑判断,找到了要怎么处理
if (ok:=FindText(X, Y, 1446-150000, 536-150000, 1446+150000, 536+150000, 0, 0, Text))
{
    FindText().Click(X, Y, "L")
}
    
;#################################################################


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