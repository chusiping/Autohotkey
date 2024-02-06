; 通用的FindText封装函数 用FindText抓取图片之后，这些值都是固定的，所以可以放在这里ahk里，方便业务层调用
FindTextGeneral(Text, x1, y1, x2, y2, ByRef X, ByRef Y)
{
    global FindTextClass
    ; 调整坐标范围
    x1 := x1 - 150000
    y1 := y1 - 150000
    x2 := x2 + 150000
    y2 := y2 + 150000
    ; 调用FindText
    return FindTextClass.FindText(X, Y, x1, y1, x2, y2, 0, 0, Text)
}

;企业微信的通讯录的 - 返回按钮
Text_返回 := "|<>*172$73.0000000000000000303zXzzz00000kzzlzzzU0000QM00k00k00006A00M00M0MM03600A00A0MM0030060060MM001zz37zX0MM03kk1VX0lUMM01sM1klUMkMM00ADUkMkAMMM0064ssAM6AAA0036CM6A3633001X1s361X0kk00lUw1XzlUAA00NUz0lzsk31U0AktkMkAM0ks06lsQA00A0A4033k7600600003kU0300300003C001zzzU00013zzsk00k00000000M00N"
ok_返回 := FindTextGeneral(Text_返回, 1446, 536, 1446, 536, X, Y)

;企业微信的通讯录的 - 编辑按钮
Text_编辑:="|<>*158$50.10601U000M1U0MDzUATzs620M37zy10U21VU0Xzc0UMM08A3zsAq022UU63BzzVg001yM08PDzw9a004lzz0ljzXA81UATzwn20M67YHDwzy31N4kA81UzKFA320M85an0kzy03TzkDjzU0qFBzm0M7xYH8kU73qN4kAzzs1aFA3C0M0lYT0k0604M3UA01W"
ok_编辑 := FindTextGeneral(Text_编辑, 1581, 536, 1581, 536, X, Y)
