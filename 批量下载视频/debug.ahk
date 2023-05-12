print(text)
{
	oSciTE:= ComObjActive("SciTE4AHK.Application")
	oSciTE.Output(text)
}

log(内容){
	if(WinExist("ahk_class ConsoleWindowClass")=0)
	{
		Run,cmd.exe
		sleep 500
	}
	ControlSend,,::%内容%`r,ahk_class ConsoleWindowClass
}