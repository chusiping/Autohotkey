#Persistent
#SingleInstance Force
#Include del循环删除企业微信用户_findTextClass_en.ahk
#Include del循环删除企业微信用户_通用函数.ahk
CoordMode, Mouse, Screen

MsgBox, 定位到开始页面，准备开始



; ;企业微信的通讯录的 - 返回按钮
; Text_返回 := "|<>*172$73.0000000000000000303zXzzz00000kzzlzzzU0000QM00k00k00006A00M00M0MM03600A00A0MM0030060060MM001zz37zX0MM03kk1VX0lUMM01sM1klUMkMM00ADUkMkAMMM0064ssAM6AAA0036CM6A3633001X1s361X0kk00lUw1XzlUAA00NUz0lzsk31U0AktkMkAM0ks06lsQA00A0A4033k7600600003kU0300300003C001zzzU00013zzsk00k00000000M00N"
; ;使用独立变量值引用，多次调用不会出错
; ok_返回 := FindTextGeneral(Text_返回, 1446, 536, 1446, 536, X, Y)
; x返回 :=x
; y返回 :=y


; Text_删除:="|<>*179$49.zzzszzwzw21wM1wTy10mA0w7zAaN6Aw1zaHAX4S8Tn9aFWCC7tYn8lADVwmNYM4DsCNAmA0007AaN6100K000X4zXz000FWDlztYn8lbszwmNYMk00SNAmAM00DAaN6AT7zaHAX0NWTX9aFU8l7lYnskQsltkNwMwQQQUAyAQSD400M6DM7zTYQ77w7z"
; ok_删除 := FindTextGeneral(Text_删除, 2091, 974, 2091, 974, X, Y)
; x删除 :=x
; y删除 :=y


Text_编辑:="|<>*158$50.10601U000M1U0MDzUATzs620M37zy10U21VU0Xzc0UMM08A3zsAq022UU63BzzVg001yM08PDzw9a004lzz0ljzXA81UATzwn20M67YHDwzy31N4kA81UzKFA320M85an0kzy03TzkDjzU0qFBzm0M7xYH8kU73qN4kAzzs1aFA3C0M0lYT0k0604M3UA01W"
ok_编辑 := FindTextGeneral(Text_编辑, 1581, 536, 1581, 536, X, Y)
x编辑 :=x
y编辑 :=y
if (Text_编辑)
{
    MsgBox, % "找到 - 编辑，坐标: " X编辑 ", " Y编辑
    MouseMove,  %X编辑% , %Y编辑%
}
else
{
    MsgBox, 未找到编辑
}

Esc::ExitApp


