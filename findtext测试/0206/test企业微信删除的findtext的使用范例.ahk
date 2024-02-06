#Include test企业微信删除的findTextClass_en.ahk   
#Include test企业微信删除的通用函数.ahk

if (ok_返回)
{
    MsgBox, % "找到 - 返回，坐标: " X ", " Y
}
else
{
    MsgBox, 未找返回
}

if (Text_编辑)
{
    MsgBox, % "找到 - 编辑，坐标: " X ", " Y
}
else
{
    MsgBox, 未找到编辑
}


