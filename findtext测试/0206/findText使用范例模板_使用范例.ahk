#Include findText使用范例模板_findTextClass_en.ahk
#Include findText使用范例模板_通用函数.ahk

if (ok_返回)
{
    MsgBox, % "找到 - 返回，坐标: " X返回 ", " Y返回
}
else
{
    MsgBox, 未找返回
}

if (Text_编辑)
{
    MsgBox, % "找到 - 编辑，坐标: " X编辑 ", " Y编辑
}
else
{
    MsgBox, 未找到编辑
}


