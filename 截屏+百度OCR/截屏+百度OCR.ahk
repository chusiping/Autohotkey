#SingleInstance, Ignore
#Persistent
#Include JSON.ahk
#Include Gdip.ahk
; Tray Menu
Menu, Tray, Icon, Shell32.dll, 260 
Menu, Tray, NoStandard
Menu, Tray, Tip, Screenshot OCR
Menu, Tray, Click, 1
Menu, Tray, Add, 设置, Show_st
Menu, Tray, Default, 设置
Menu, Tray, Add, 开启OCR, Get_tk
Menu, Tray, Add, 动图显示, DSSwitch
Menu, Tray, Add, 重启, ReloadSub
Menu, Tray, Add, 退出, ExitSub

if not A_IsAdmin									;管理员权限打开
	try
	{
		Run *RunAs "%A_ScriptFullPath%"
		ExitApp
	}

Global OverlayFlag, pToken, token, BDflag := 0, BDflag2 := 0, DS := 1, stHwnd, Ls, _Ex:=[], _Tp:=[]
Global BD_Configfile:=A_ScriptDir "\Config.ini"

create_st:=1
	
Gosub create_st

; Load Config
if !FileExist(BD_Configfile)
	gosub Create_Config
_Se:=StrSplit(Readini(BD_Configfile),"`n")
loop % _Se.length()
{
	_Ke:=StrSplit(Readini(BD_Configfile,"",_Se[A_Index]),"`n")
	loop % _Ke.length()
	{
		_Va:=StrSplit(_Ke[A_Index],"=")
		tVar:=_Va[1]
		%tVar%:=_Va[2]
	}
}



F10::
	MypBitmap := ScreenCapture(TLX, TLY, BW, BH)
	ScreenSize := TLX "|" TLY "|" BW "|" BH
	if BDflag
	{
		if 强制保存 || (GetKeyState("Ctrl", "P") = 1) {
			FormatTime, TimeStamp, , yyyyMMdd_HHmmss
			Gdip_SaveBitmapToFile(MypBitmap, A_Desktop . "\" . TimeStamp . "." . 图片格式, 图片质量)
		}
		msgbox % clipboard := bdocr_Bitmap(MypBitmap, token)
	} else {
		if 强制保存 || (GetKeyState("Ctrl", "P") = 1) {
			FormatTime, TimeStamp, , yyyyMMdd_HHmmss
			Gdip_SaveBitmapToFile(MypBitmap, A_Desktop . "\" . TimeStamp . "." . 图片格式, 图片质量)
		} else
			Gdip_SetBitmapToClipboard(MypBitmap)
	}
	DeleteObject(MypBitmap)
	Gdip_DisposeImage(MypBitmap)
	Gdip_Shutdown(pToken)
Return

#F3::
	图片格式:=Readini(BD_Configfile, "图片格式", "IMAGE")
	图片质量:=Readini(BD_Configfile, "图片质量", "IMAGE")
	MypBitmap := BitmapFromRect(ScreenPass)
	if BDflag
	{
		if (GetKeyState("Ctrl", "P") = 1) {
			FormatTime, TimeStamp, , yyyyMMdd_HHmmss
			Gdip_SaveBitmapToFile(MypBitmap, A_Desktop . "\" . TimeStamp . "." . 图片格式, 图片质量)
		}
		msgbox % clipboard := bdocr_Bitmap(MypBitmap, token)
	} else {
		FormatTime, TimeStamp, , yyyyMMdd_HHmmss
		Gdip_SaveBitmapToFile(MypBitmap, A_Desktop . "\" . TimeStamp . "." . 图片格式, 图片质量)
	}
	DeleteObject(MypBitmap)
	Gdip_DisposeImage(MypBitmap)
	Gdip_Shutdown(pToken)
Return

BitmapFromRect(ByRef ScreenPass := "")
{
	if (ScreenPass = "")
	{
		MypBitmap := ScreenCapture(TLX, TLY, BW, BH)
		ScreenPass := TLX "|" TLY "|" BW "|" BH
	} else {
		if (!pToken := Gdip_Startup()) {
		  msgbox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
		  ExitApp
		}
		MypBitmap := Gdip_BitmapFromScreen(ScreenPass)

		S := StrSplit(ScreenPass, "|")
		BW := S[3], BH := S[4]
		_Alpha:=Readini(BD_Configfile, "保留透明度", "IMAGE")
		if !_Alpha
		{
			NewpBitmap := Gdip_CloneBitmapArea(MypBitmap, 0, 0, BW, BH, 0x21808)
			DeleteObject(MypBitmap)
			Gdip_DisposeImage(MypBitmap)
			MypBitmap := NewpBitmap
		}
	}
	Return MypBitmap
}

; User defined box and the dimensions
ScreenCapture(ByRef TopLeftX, ByRef TopLeftY, ByRef XWidth, ByRef YHeight) ;This function needs to Return the coords of the top left corner x/y  of the square and bottom right corner x/y of the square
{
	CoordMode, ToolTip, Screen
	CoordMode, Pixel, Screen
	CoordMode, Mouse, Screen

	SysGet, Width, 78
	SysGet, Height, 79

	SysGet, X0, 76
	SysGet, Y0, 77

	WS_EX_LAYERED := 0x00080000 		;positioned here for ease of GDI+ use
	WS_EX_NOACTIVATE := 0x08000000	;ToolWindow
	
	; {
	;generate GUI to cover the active window so you don't play with things in it while you select your box.
	Gui, 1: +LastFound -Caption +AlwaysOnTop +ToolWindow
	Gui, 1: Show, Hide
	WinSet, Transparent, 1
	Gui, 1: Show, NA x%X0% y%Y0% w%Width% h%Height%

	OverlayFlag := 1
	;Generate the GDI+
	Gui, 2: +LastFound -Caption +AlwaysOnTop +E%WS_EX_LAYERED% +E%WS_EX_NOACTIVATE%
	Gui, 2: Show, NA
	
	;Wait for the left mouse button to start the GDI+
	;KeyWait, LButton, D

	if (!pToken := Gdip_Startup()) {
	  msgbox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
	  ExitApp
	}
	
	hwnd1 := WinExist()
	hbm := CreateDIBSection(Width, Height)
	hdc := CreateCompatibleDC()
	obm := SelectObject(hdc, hbm)
	G := Gdip_GraphicsFromHDC(hdc)
	Gdip_SetSmoothingMode(G, 4)
	pPen := Gdip_CreatePen(0xff00aeff, 4)
	
	TopLeftX := X0, TopLeftY := Y0, XWidth := Width, YHeight := Height
	if DS
	{
		MypBitmap := Gdip_BitmapFromScreen(0 "|" 0 "|" Width "|" Height)
		Gdip_DrawImage(G, MypBitmap, TopLeftX, TopLeftY, Width, Height, TopLeftX, TopLeftY, Width, Height)		;静态展示
	}
	Gdip_DrawRoundedRectangle(G, pPen, 0, 0, Width-1, Height-1, 1)
	UpdateLayeredWindow(hwnd1, hdc, X0, Y0, Width, Height)
			
	SelectObject(hdc, obm)
	DeleteObject(hbm)
	DeleteDC(hdc)
	Gdip_DeleteGraphics(G)
	Gdip_DeletePen(pPen)
			
	Tooltip %Width% x %Height%, 0, 0
	while (GetKeyState("LButton", "P") = 0)
	{
		MouseGetPos, NewMX, NewMY
		if !((NewMX=OldMX)&&(NewMY=OldMY))
		{
			OldMX := NewMX
			OldMY := NewMY
			
			if DS {
				hwnd1 := WinExist()
				hbm := CreateDIBSection(Width, Height)
				hdc := CreateCompatibleDC()
				obm := SelectObject(hdc, hbm)
				G := Gdip_GraphicsFromHDC(hdc)
				Gdip_SetSmoothingMode(G, 4)
				Gdip_SetInterpolationMode(G, 7)
				pPen := Gdip_CreatePen(0xff00aeff, 4)
				pPen1 := Gdip_CreatePen(0xff00aeff, 1)
				hbm2 := CreateDIBSection(Width, Height)
				hdc2 := CreateCompatibleDC()
				obm2 := SelectObject(hdc2, hbm2)
				G2 := Gdip_GraphicsFromHDC(hdc2)
				Gdip_DrawImage(G2, MypBitmap, 0, 0, Width, Height, 0, 0, Width, Height)
				pPen1 := Gdip_CreatePen(0x9fb2d3fa, 1)
				Gdip_DrawLine(G2, pPen1, NewMX, NewMY - 12, NewMX, NewMY + 12)
				Gdip_DrawLine(G2, pPen1, NewMX - 12, NewMY, NewMX + 12, NewMY)
				Gdip_DrawImage(G, MypBitmap, 0, 0, Width, Height, 0, 0, Width, Height)				;静态展示
				Gdip_DrawImage(G, MypBitmap, TopLeftX, TopLeftY, XWidth, YHeight, TopLeftX, TopLeftY, XWidth, YHeight)
				; StretchBlt(hdc, TopLeftX, TopLeftY, XWidth, YHeight, hdc2, TopLeftX, TopLeftY, XWidth, YHeight)
				Gdip_DrawRoundedRectangle(G, pPen, 0, 0, Width-1, Height-1, 1)	;蓝色边框
				StretchBlt(hdc, NewMX + 15, NewMY + 25, 126, 126, hdc2, NewMX - 10, NewMY - 10, 21, 21)
				pPen2 := Gdip_CreatePen(0xff000000, 1)
				Gdip_DrawLine(G, pPen2, NewMX + 14, NewMY + 24, NewMX + 141, NewMY + 24)
				Gdip_DrawLine(G, pPen2, NewMX + 14, NewMY + 24, NewMX + 14, NewMY + 151)
				Gdip_DrawLine(G, pPen2, NewMX + 141, NewMY + 24, NewMX + 141, NewMY + 151)
				Gdip_DrawLine(G, pPen2, NewMX + 14, NewMY + 151, NewMX + 141, NewMY + 151)
				UpdateLayeredWindow(hwnd1, hdc, X0, Y0, Width, Height)
				SelectObject(hdc2, obm2)
				DeleteObject(hbm2)
				DeleteDC(hdc2)		
				Gdip_DeleteGraphics(G2)
				SelectObject(hdc, obm)
				DeleteObject(hbm)
				DeleteDC(hdc)
				Gdip_DeleteGraphics(G)
				Gdip_DeletePen(pPen)
				Gdip_DeletePen(pPen1)
				Gdip_DeletePen(pPen2)
			} 
		}
		
		if (GetKeyState("RButton", "P") = 1)or(GetKeyState("Esc", "P") = 1) {
			if (GetKeyState("RButton", "P") = 1)
				KeyWait, RButton, up
			Tooltip
			Gui, 2:Destroy
			DeleteObject(MypBitmap)
			Gdip_DisposeImage(MypBitmap)
			Gdip_Shutdown(pToken)
			Gui, 1:Destroy
			OverlayFlag := 0
			exit
		}
	}

	MouseGetPos, MX, MY
	OldMX := MX,	OldMY := MY
	Loop 
	{
		MouseGetPos, NewMX, NewMY
		if !(abs(NewMX-MX) + abs(NewMY-MY) < 6)
		if !((NewMX=OldMX)&&(NewMY=OldMY))
		{
			OldMX := NewMX
			OldMY := NewMY
			xw := abs(NewMX-MX)
			yh := abs(NewMY-MY)
			XWidth := xw + 1
			YHeight := yh + 1
			Tooltip %XWidth% x %YHeight%, TopLeftX := (MX < NewMX ? MX : NewMX) ,(TopLeftY := (MY < NewMY ? MY : NewMY)) -30
			
			hwnd1 := WinExist()
			hbm := CreateDIBSection(Width, Height)
			hdc := CreateCompatibleDC()
			obm := SelectObject(hdc, hbm)
			G := Gdip_GraphicsFromHDC(hdc)
			Gdip_SetSmoothingMode(G, 4)
			pPen := Gdip_CreatePen(0xff00aeff, 3)											;蓝色边框
			pBrush := Gdip_BrushCreateSolid(0x8f000000)										;灰色遮罩
			
			if DS {
				hbm2 := CreateDIBSection(Width, Height)
				hdc2 := CreateCompatibleDC()
				obm2 := SelectObject(hdc2, hbm2)
				G2 := Gdip_GraphicsFromHDC(hdc2)
				Gdip_DrawImage(G2, MypBitmap, 0, 0, Width, Height, 0, 0, Width, Height)
				pPen1 := Gdip_CreatePen(0x9fb2d3fa, 1)
				Gdip_DrawLine(G2, pPen1, NewMX, NewMY - 10, NewMX, NewMY + 10)
				Gdip_DrawLine(G2, pPen1, NewMX - 10, NewMY, NewMX + 10, NewMY)
				
				Gdip_DrawImage(G, MypBitmap, 0, 0, Width, Height, 0, 0, Width, Height)				;静态展示
				Gdip_FillRoundedRectangle(G, pBrush, 0, 0, Width, Height, 1)
				Gdip_DrawImage(G, MypBitmap, TopLeftX, TopLeftY, XWidth, YHeight, TopLeftX, TopLeftY, XWidth, YHeight)
				; StretchBlt(hdc, TopLeftX, TopLeftY, XWidth, YHeight, hdc2, TopLeftX, TopLeftY, XWidth, YHeight)
				Gdip_DrawRoundedRectangle(G, pPen, TopLeftX - 2, TopLeftY - 2, XWidth + 3, YHeight + 3, 2)	;蓝色边框
				StretchBlt(hdc, NewMX + 15, NewMY + 25, 126, 126, hdc2, NewMX - 10, NewMY - 10, 21, 21)
				pPen2 := Gdip_CreatePen(0xff000000, 1)
				Gdip_DrawLine(G, pPen2, NewMX + 14, NewMY + 24, NewMX + 141, NewMY + 24)
				Gdip_DrawLine(G, pPen2, NewMX + 14, NewMY + 24, NewMX + 14, NewMY + 151)
				Gdip_DrawLine(G, pPen2, NewMX + 141, NewMY + 24, NewMX + 141, NewMY + 151)
				Gdip_DrawLine(G, pPen2, NewMX + 14, NewMY + 151, NewMX + 141, NewMY + 151)
				UpdateLayeredWindow(hwnd1, hdc, X0, Y0, Width, Height)
				SelectObject(hdc2, obm2)
				DeleteObject(hbm2)
				DeleteDC(hdc2)		
				Gdip_DeleteGraphics(G2)
			} else {
				wdc := GetDC(hwnd1)
				Gdip_FillRoundedRectangle(G, pBrush, 0, 0, Width, Height, 1)
				StretchBlt(hdc, TopLeftX, TopLeftY, XWidth, YHeight, wdc, TopLeftX, TopLeftY, XWidth, YHeight)		;透明遮罩
				Gdip_DrawRoundedRectangle(G, pPen, TopLeftX - 1, TopLeftY - 1, XWidth + 1, YHeight + 1, 2)		;蓝色边框
				ReleaseDC(wdc, hwnd1)
				UpdateLayeredWindow(hwnd1, hdc, X0, Y0, Width, Height)
			}
			
			
			
			SelectObject(hdc, obm)
			DeleteObject(hbm)
			DeleteDC(hdc)		
			Gdip_DeleteGraphics(G)
			Gdip_DeletePen(pPen)
			Gdip_DeleteBrush(pBrush)
		}
		
		if (GetKeyState("LButton", "P") = 0) {
			Break
		}
		if (GetKeyState("RButton", "P") = 1)or(GetKeyState("Esc", "P") = 1) {
			if (GetKeyState("RButton", "P") = 1)
				KeyWait, RButton, up
			Tooltip
			Gui, 2:Destroy
			DeleteObject(MypBitmap)
			Gdip_DisposeImage(MypBitmap)
			Gdip_Shutdown(pToken)
			Gui, 1:Destroy
			OverlayFlag := 0
			exit
		}
	}
	
	Tooltip
	Gui, 2:Destroy
	Gui, 1:Destroy

	OverlayFlag := 0

	sleep 10
		
	if DS
	{
		NewpBitmap := (保留透明度 ? Gdip_CloneBitmapArea(MypBitmap, TopLeftX, TopLeftY, XWidth, YHeight) : Gdip_CloneBitmapArea(MypBitmap, TopLeftX, TopLeftY, XWidth, YHeight, 0x21808))
		DeleteObject(MypBitmap)
		Gdip_DisposeImage(MypBitmap)
		Return NewpBitmap
	} else {
		MypBitmap := Gdip_BitmapFromScreen(TopLeftX "|" TopLeftY "|" XWidth "|" YHeight)
		if !保留透明度
		{
			NewpBitmap := Gdip_CloneBitmapArea(MypBitmap, 0, 0, XWidth, YHeight, 0x21808)
			DeleteObject(MypBitmap)
			Gdip_DisposeImage(MypBitmap)
			Return NewpBitmap
		} else
			Return MypBitmap
	}
}

Dlg_Color(ByRef Color, hGui=0)    ;调用系统颜色对话框
{
    clr := ((Color & 0xFF) << 16) + (Color & 0xFF00) + ((Color >> 16) & 0xFF)
    VarSetCapacity(CHOOSECOLOR, 0x24, 0), VarSetCapacity(CUSTOM, 64, 0)
    ,NumPut(0x24,        CHOOSECOLOR, 0)    ; DWORD lStructSize 
    ,NumPut(hGui,        CHOOSECOLOR, 4)    ; HWND hwndOwner (makes dialog "modal"). 
    ,NumPut(clr,        CHOOSECOLOR, 12)    ; clr.rgbResult 
    ,NumPut(&CUSTOM,    CHOOSECOLOR, 16)    ; COLORREF *lpCustColors
    ,NumPut(0x00000103,CHOOSECOLOR, 20)    ; Flag: CC_ANYCOLOR || CC_RGBINIT 

    nRC := DllCall("comdlg32\ChooseColor", str, CHOOSECOLOR)  ; Display the dialog. 
    if (errorlevel <> 0) || (nRC = 0) 
        return  false 
    clr := NumGet(CHOOSECOLOR, 12) 
    oldFormat := A_FormatInteger 
    SetFormat, integer, hex    ; Show RGB color extracted below in hex format. 

    Color := (clr & 0xff00) + ((clr & 0xff0000) >> 16) + ((clr & 0xff) << 16)    ;convert to rgb 
	
    StringTrimLeft, Color, Color, 2 
    loop, % 6-strlen(Color) 
        Color=0%Color% 
    Color=%Color% 
    SetFormat, integer, %oldFormat% 
    return true
}

ToolTipOff:
ToolTip
Return

Help:
MsgBox, 64, 使用说明,%文本类型说明%
Return

Create_Config:
	IniWrite, % "", %BD_Configfile%, BDOCR, API_Key
	IniWrite, % "", %BD_Configfile%, BDOCR, Secret_Key
	IniWrite, % "", %BD_Configfile%, BDOCR, BD_token
	IniWrite, general_basic, %BD_Configfile%, BDOCR, 识别类型
	IniWrite, 0 , %BD_Configfile%, BDOCR, 保留换行
	IniWrite, 0, %BD_Configfile%, BDOCR, 保留空格
	FileAppend, `n, %BD_Configfile%
	IniWrite, jpg, %BD_Configfile%, IMAGE, 图片格式
	IniWrite, 75, %BD_Configfile%, IMAGE, 图片质量
	IniWrite, 0, %BD_Configfile%, IMAGE, 保留透明度
	IniWrite, 0, %BD_Configfile%, IMAGE, 强制保存
return

Create_st:
	global cz:=0
	Gui, st:Default
	Gui, st:+ToolWindow +AlwaysOnTop +HwndstHwnd
	Gui, st:Margin, 10, 10
	; Gui, st:Color, DDEEFF
	Gui, st:Font, s10, Verdana
	Gui, Add, Tab3, x10 y10 w220 h215, Ocr|截图
	Gui, Tab, Ocr
	Gui, Add, Text, xm x15 y+10 w80 h20 +Right, API_Key
	Gui, Add, Edit, x+5 w120 h20 vAPI_Key gGETV
	Gui, Add, Text, xm x15 y+10 w80 h20 +Right, Secret_Key
	Gui, Add, Edit, x+5 w120 h20 vSecret_Key gGETV
	Gui, Add, Text, xm x15 y+10 w80 h20 +Right, BD_token
	Gui, Add, Edit, x+5 w120 h20 vBD_token gGETV
	Gui, Add, Text, xm x15 y+10 w80 h20 +Right, 识别类型
	Gui, Add, DropDownList, x+5 w120 h20 v识别类型 r4 gGETV AltSubmit, 通用文字|高精度|手写文字|网络图片文字
	Gui, Add, Text, xm x15 y+10 w80 h20 +Right, 保留换行
	Gui, Add, Checkbox, x+5 w120 h20 v保留换行 gGETV
	Gui, Add, Text, xm x15 y+10 w80 h20 +Right, 保留空格
	Gui, Add, Checkbox, x+5 w120 h20 v保留空格 gGETV
	Gui, Tab, 截图
	Gui, Add, Text, xm x15 y+10 w80 h20 +Right, 图片格式
	Gui, Add, DropDownList, x+5 w120 h20 v图片格式 r5 gGETV AltSubmit, bmp|jpg|gif|tif|png
	Gui, Add, Text, xm x15 y+10 w80 h20 +Right, 图片质量
	Gui, Add, Edit, x+5 w120 h20 v图片质量 Limit3 number gGETV
	Gui, Add, UpDown, Range1-100
	Gui, Add, Text, xm x15 y+10 w80 h20 +Right, 保留透明度
	Gui, Add, Checkbox, x+5 w120 h20 v保留透明度 gGETV
	Gui, Add, Text, xm x15 y+10 w80 h20 +Right, 强制保存
	Gui, Add, Checkbox, x+5 w120 h20 v强制保存 gGETV
	Onmessage(0x18,"WM_SHOWWINDOW")
	Gui, st:Show, Hide, 设置
Return

Show_st:
	if !FileExist(BD_Configfile)
		gosub Create_Config
	Gui, st:Show, NA, 设置
Return

GETV:
	GuiControlGet, tVa, , % A_GuiControl
	if A_GuiControl = 图片格式
		tVa:=_Ex[tVa]
	else if A_GuiControl = 识别类型
		tVa:=_Tp[tVa]
	else if A_GuiControl = 图片质量
		{
			if tVa > 100
			{
				tVa:=100,	
				GuiControl,, % A_GuiControl, %tVa%
			}
		}
	%A_GuiControl%:=tVa
	if cz
		Writeini(BD_Configfile, tVa, A_GuiControl, (RegExMatch(A_GuiControl, "^(?i:图片格式|图片质量|保留透明度|强制保存)$") ? "IMAGE" : "BDOCR"))
return

WM_SHOWWINDOW(wParam, lParam, msg, hwnd)
{
	if % hwnd = sthwnd && wParam
	{
		Gui, st:Show, NA, 设置
		ControlFocus,, ahk_id %stHwnd%
		WinGet, ListC, ControlListHwnd, ahk_id %sthwnd%
		C_S:=StrSplit(ListC,"`n")
		Global N_:=[],C_:=[]
		N_len:=0
		loop % C_S.length()
		{
			GuiControlGet, cName, Name, % C_S[A_index]
			if cName
			{
				N_[N_len+=1]:=cName
				C_[N_len]:=C_S[A_index]
			}
		}
		C_S =

		global _Ex:=["bmp","jpg","gif","tif","png"]
		global _Tp:=["general_basic","accurate_basic","handwriting","webimage"]
		loop % N_len
		{
			tt:=Readini(BD_Configfile, N_[A_index], (RegExMatch(N_[A_index], "^(?i:图片格式|图片质量|保留透明度|强制保存)$") ? "IMAGE" : "BDOCR"))
			; tVar:=N_[A_index]
			; %tVar%:=tt
			if  % N_[A_index] = "图片格式"
			{
				loop % _Ex.length()
				{
					if _Ex[A_index] = tt
						GuiControl, Choose, 图片格式, % A_index, break
				}
				Continue
			} else if % N_[A_index] = "识别类型"
			{
				loop % _Tp.length()
				{
					if _Tp[A_index] = tt
						GuiControl, Choose, 识别类型, % A_index, break
				}
				Continue
			}
			if tt != ERROR
				GuiControl,, % C_[A_index], %tt%
		}
		cz:=1
	}
	if % hwnd = sthwnd && !wParam
		WinClose, 设置
}

Readini(_BD_Configfile, _key:="", _Section:="")
{
	if FileExist(_BD_Configfile)
	{
		Iniread, initmp, %_BD_Configfile%, %_Section%, %_key%
		return initmp
	}
}

Writeini(_BD_Configfile, _value, _key, _Section:="Config")
{
	if _value !=
		IniWrite, %_value%, %_BD_Configfile%, %_Section%, %_key%
}

Get_token(BD_Key,BD_Secret)
{
	BD_access_token := Readini(BD_Configfile, "BD_token", "BDOCR")
	if BD_access_token && (Get_Ocr("/9j/4AAQSkZJRgABAQEAYABgAAD//gAUU29mdHdhcmU6IFNuaXBhc3Rl/9sAQwADAgIDAgIDAwMDBAMDBAUIBQUEBAUKBwcGCAwKDAwLCgsLDQ4SEA0OEQ4LCxAWEBETFBUVFQwPFxgWFBgSFBUU/9sAQwEDBAQFBAUJBQUJFA0LDRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU/8AAEQgAAQABAwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A/VOiiigD/9k=", BD_access_token) != "image size error")
		return BD_access_token
	BD_Url := "https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials"
	BD_Url := BD_Url "&client_id=" BD_Key "&client_secret=" BD_Secret
	BD_Json := JSON.Load(URLDownloadToVar(BD_Url))
	BD_access_token := BD_Json.access_token
	msgbox % BD_access_token "|" BD_Key
	if BD_access_token
	{
		IniWrite, %BD_access_token%, %BD_Configfile%, BDOCR, BD_token
		return BD_access_token
	}
}

bdocr(Address, BD_access_token, txttype := "")
{
	if !txttype
		if tmp := Readini(BD_Configfile, "识别类型", "BDOCR")
			txttype := tmp 
		else
			txttype := "general_basic"
	
	Fileread, tpic, *c %Address%
	FileGetSize, tbt, %Address%
	
	image:=bintobase64(&tpic, tbt)
	
	return Get_Ocr(image, BD_access_token, txttype)
}

bdocr_Bitmap(pBitmap, BD_access_token, Extension:="jpg", Quality:=75, txttype := "")
{
	if !txttype
		if tmp := Readini(BD_Configfile, "识别类型", "BDOCR")
			txttype := tmp 
		else
			txttype := "general_basic"
			
	image:=BitmapToBase64(pBitmap, Extension, Quality)
	
	return Get_Ocr(image, BD_access_token, txttype)
}

Get_Ocr(imgBase64, BD_access_token, txttype:="general_basic")
{
	BD_Url := "https://aip.baidubce.com/rest/2.0/ocr/v1/" txttype "?access_token=" BD_access_token
	postdata := "image=" urlencode(imgBase64)
	BD_ReturnTxt := URLDownloadToVar(BD_Url, "UTF-8", "POST", postdata, {"Content-Type":"application/x-www-form-urlencoded"})
	BD_Json := JSON.Load(BD_ReturnTxt)
	if BD_Json.error_msg != ""
		return BD_Json.error_msg
	wordsC := BD_Json.words_result_num
	hh := Readini(BD_Configfile, "保留换行", "BDOCR")
	if wordsC > 1
	{
		Loop % wordsC
		{
			txtmp .= BD_Json.words_result[A_Index].words
			if hh
				txtmp .= "`n"
		}
		if !Readini(BD_Configfile, "保留空格", "BDOCR")
			StringReplace, txtmp, txtmp, %A_Space%,,1
		return txtmp
	}
	else
	{
		Return BD_Json.words_result[1].words
	}
	Return 0
}

URLDownloadToVar(url, Encoding = "", Method="GET", postData="", headers:="")
{
	hObject:=ComObjCreate("WinHttp.WinHttpRequest.5.1")
	hObject.SetTimeouts(30000, 30000, 1200000, 1200000) 
	try
		hObject.Open(Method, url, (Method="POST" ? True : False))  
	
	if IsObject(headers)
	{
		for k, v in headers
		{
			if v
				hObject.SetRequestHeader(k, v)
		}
	}
	if postData
	{
		try
			hObject.Send(postData)
		hObject.WaitForResponse(-1)
	}
	else
	{
		try
			hObject.Send()
	}

	if (Encoding && hObject.ResponseBody)
	{
		oADO := ComObjCreate("adodb.stream")
		oADO.Type := 1
		oADO.Mode := 3
		oADO.Open()
		oADO.Write(hObject.ResponseBody)
		oADO.Position := 0
		oADO.Type := 2
		oADO.Charset := Encoding
		return oADO.ReadText(), oADO.Close()
	}
	try 
		return hObject.ResponseText
}

BinToBase64(binpointer, bytes, Flags:=0x40000001)
{
	DllCall("crypt32\CryptBinaryToString", "Ptr", binpointer, "Uint", bytes, "Uint", Flags, "Ptr", 0, "Uint*", nSize)
	VarSetCapacity(sString, nSize*2)
	DllCall("crypt32\CryptBinaryToString", "Ptr", binpointer, "Uint", bytes, "Uint", Flags, "str", sString, "Uint*", nSize)
	return StrGet(&sString, (A_IsUnicode ? "utf-16" : "cp0"))
}

StreamToBase64(pStream)
{
	Ptr:=A_PtrSize ? "UPtr" : "UInt"
	DllCall("ole32\GetHGlobalFromStream", Ptr, pStream, "ptr*", hMemory)
	
	pMemory:=DllCall("GlobalLock", Ptr, hMemory, Ptr)
	pSize:=DllCall("GlobalSize", Ptr, hMemory, Ptr)
	DllCall("GlobalUnlock", Ptr, hMemory)
	
	return BinToBase64(pMemory,pSize)
}

BitmapToBase64(pBitmap, Extension:="jpg", Quality:=75)
{
	return StreamToBase64(pStream:=Gdip_SaveBitmapToStream(pBitmap, Extension, Quality)),ObjRelease(pStream)
}

AnsiToUTF8(sString)
{
	AnsiToUnicode(sString, 0, wString)
	UnicodeToAnsi(wString, 65001, zString)
	return zString
}

AnsiToUnicode(ByRef sString, CP=0, ByRef wString="")
{
	nSize:=DllCall("MultiByteToWideChar", "Uint", CP, "Uint", 0, "Uint", &sString, "int", -1, "Uint", 0, "int", 0)
	VarSetCapacity(wString, nSize * 2)
	DllCall("MultiByteToWideChar", "Uint", CP, "Uint", 0, "Uint", &sString, "int", -1, "str", wString, "int", nSize)
	return strget(&wString, "utf-16")
}

UnicodeToAnsi(ByRef wString, CP=0, ByRef sString="")
{
	nSize:=DllCall("WideCharToMultiByte", "Uint", CP, "Uint", 0, "Uint", &wString, "int", -1, "Uint", 0, "int", 0, "Uint", 0, "Uint", 0)
	VarSetCapacity(sString, nSize)
	DllCall("WideCharToMultiByte", "Uint", CP, "Uint", 0, "Uint", &wString, "int", -1, "str", sString, "int", nSize, "Uint", 0, "Uint", 0)
	return sString
}

StrPutVar(sVar, ByRef sbin, encoding)
{
	VarSetCapacity(sbin, StrPut(sVar, encoding)* ((encoding="utf-16"||encoding="cp1200")  ? 2 : 1))
    return (StrPut(sVar, &sbin, encoding) -1)* ((encoding="utf-16"||encoding="cp1200")  ? 2 : 1)
}

Urlencode(string, encoding:="utf-8")
{
	bt:=StrPutVar(string,sb,encoding)
	Loop % bt
	{
		hex:=format("{1:02x}", hex2:=NumGet(&sb, A_index-1, "Uchar"))

		if hex2
		if (hex2==33 || (hex2>=39 && hex2 <=42) || hex2==45 || hex2 ==46 || (hex2>=48 && hex2<=57) || (hex2>=65 && hex2<=90) || hex2==95 || (hex2>=97 && hex2<=122) || hex2==126)
			content .=Chr(hex2)
		else
			content .="`%" hex
	}
	return content
}

Get_tk:
if !API_Key || !Secret_Key
	if !BD_token
	{
		Gui, st:Show, NA, 设置
		WinwaitClose, ahk_id %stHwnd%
	}
	if token := Get_token(API_Key, Secret_Key)
	{
		BDflag := 1
		Menu, Tray, Delete, 开启OCR
		MsgBox, 64, 使用说明, 图片的长和宽要求最小边长不小于15 px，最长边小于2048 px；`n图像编码后大小必须小于4M，建议不要超过1M。
	} else {
	msgbox % token
		msgbox Access token无效，请检查API_Key、Secret_Key或BD_token
		BDflag2:=1
		Gui, st:Show, NA, 设置
	}
Return

DSSwitch:
	if DS := !DS
	{
		Menu, Tray, Delete, 静图显示
		Menu, Tray, Delete, 重启
		Menu, Tray, Delete, 退出
		Menu, Tray, Add, 动图显示, DSSwitch
		Menu, Tray, Add, 重启, ReloadSub
		Menu, Tray, Add, 退出, ExitSub
	} else {
		Menu, Tray, Delete, 动图显示
		Menu, Tray, Delete, 重启
		Menu, Tray, Delete, 退出
		Menu, Tray, Add, 静图显示, DSSwitch
		Menu, Tray, Add, 重启, ReloadSub
		Menu, Tray, Add, 退出, ExitSub		
	}
Return

GuiEscape:
MsgBox
Gui, st:Hide
return

ReloadSub:
Reload
Return

ExitSub:
exitapp
Return

#if OverlayFlag		;屏蔽按键
UP::
DOWN::
LEFT::
RIGHT::
	if (A_ThisHotKey = "UP")
		MouseMove, 0, -1, 0, R
	else if (A_ThisHotKey = "DOWN")
		MouseMove, 0, 1, 0, R
	else if (A_ThisHotKey = "LEFT")
		MouseMove, -1, 0, 0, R
	else if (A_ThisHotKey = "RIGHT")
		MouseMove, 1, 0, 0, R
return

Alt::
LWin::

