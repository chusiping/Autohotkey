#InstallKeybdHook
1::
	WinGetTitle, title, A
	If InStr(title,"同花顺") or InStr(title,"通达信") or InStr(title,"东方")
		send {down}
	else
		send ,{numpad1}
	return

2::
	WinGetTitle, title, A
	If InStr(title,"同花顺") or InStr(title,"通达信")  or InStr(title,"东方")
		send {up}
	else
		send ,{numpad2}
	return
`::
	WinGetTitle, title, A
	If InStr(title,"同花顺")
		send ,{F5}
	else
		send ,^w
	return
;四键五键
	XButton1::send,^w
	XButton2::send,{backspace}





