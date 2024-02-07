#Persistent
#SingleInstance Force
#Include del循环删除企业微信用户_findTextClass_en.ahk
#Include del循环删除企业微信用户_通用函数.ahk
CoordMode, Mouse, Screen


; if (ok_返回)
; {
;     MsgBox, % "找到 - 返回，坐标: " X返回 ", " Y返回
; }
; else
; {
;     MsgBox, 未找返回
; } 

if (Text_编辑)
{
    MsgBox, % "找到 - 编辑，坐标: " X编辑 ", " Y编辑
    MouseMove,  %X编辑% , %Y编辑%
}
else
{
    MsgBox, 未找到编辑
}

; if (ok_成员详情)
; {
;     MsgBox, % "找到 - 编辑，坐标: " X成员详情 ", " Y成员详情
; }
; else
; {
;     MsgBox, 未找到编辑
; }

Esc::ExitApp


