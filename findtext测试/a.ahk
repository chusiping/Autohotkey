#Include b.ahk
;https://www.autoahk.com/archives/41636

t1:=A_TickCount, Text:=X:=Y:=""

Text:="|<>*118$71.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzDzDDzzzzzzzyTsQ807zzzzzwQ7yDzDzzzzy01zzzyTzzzzzCHz004zzzzzy8byAwtzzzzzk0DwNtnzzzzzzy08k3bzzzzzwwllbbDzzzzzttXXDCTzzzzw03760QzzzzzzbaCAwtzzzzzt3AQNtnzzzzzW2Msn0bzzzzzAllk0bDzzzzztnXXzCTzzzzy3D77yMzzzzzzzzyDz3zzzzzzzzzzzzzzzzzzzzzzzzzzz"

if !(ok := FindText(X, Y, pX, pY, pX+pW, pY+pH, 0.000001,, Text)) { 
    
}

if (ok:=FindText(X:="wait", Y:=2, 58-150000, 197-150000, 58+150000, 197+150000, 0, 0, Text))
{
	FindText().Click(X, Y, "L")
}
else
{
  MsgBox, 图像/文本未找到。请确认所有设置无误，且图像在 Paint 中可见！
  ExitApp
}







