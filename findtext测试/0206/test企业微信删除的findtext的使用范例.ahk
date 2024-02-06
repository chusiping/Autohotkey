#Include test企业微信删除的findTextClass_en.ahk   ; 复制 FindText_415.ahk 里的class放到lib.ahk里，GUI给的class有乱码无法直接使用

t1:=A_TickCount, Text:=X:=Y:=""

;企业微信的“返回按钮” ，通过FindText-GUI转成灰度值得到下面的代码
Text:="|<>*172$73.0000000000000000303zXzzz00000kzzlzzzU0000QM00k00k00006A00M00M0MM03600A00A0MM0030060060MM001zz37zX0MM03kk1VX0lUMM01sM1klUMkMM00ADUkMkAMMM0064ssAM6AAA0036CM6A3633001X1s361X0kk00lUw1XzlUAA00NUz0lzsk31U0AktkMkAM0ks06lsQA00A0A4033k7600600003kU0300300003C001zzzU00013zzsk00k00000000M00N"

;函数调用是否找到的返回值，此函数必须
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



