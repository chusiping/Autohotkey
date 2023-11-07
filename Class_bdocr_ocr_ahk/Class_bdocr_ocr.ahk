#Include Class_bdocr.ahk
#Include JSON.ahk
#Include getSnipastePath.ahk

API_KEY:="KgygBk7Mp60V8kjmVGDGPiQi"
SECRET_KEY:="rLujoGfTzs6RHHHzmMRmKb9wBCqOypSp"

; 使用指引 
; 1 用spipast截图钉住一张图片产生在路径下保存(程序会自动找到最新的图片)
; 2 ctrl+shift+c 触发函数识别1中的图片
; 3 MsgBox提示内容并复制到剪贴板
^+c::
	if (API_KEY="这里填自己的")
	{
		MsgBox 0x40010, , 照着教程先去 https://cloud.baidu.com/ 申请账号。
		ExitApp
	}

	pngf:=getPngPath()
	; MsgBox, % pngf

	ocr:=new bdocr(API_KEY, SECRET_KEY)
	ret:=ocr.GetOcr(pngf,"accurate_basic")

	; ret:=ocr.GetOcr(A_ScriptDir "\3.png","accurate_basic")	; 高精度识别
	; ret:=ocr.GetOcr(pBitmap,"general_basic")					; 普通精度识别
	for k,v in JSON.Load(ret).words_result
		str.=v.words "`r`n"
	MsgBox, % str
	Clipboard := str
	ClipWait, 1
	Return


