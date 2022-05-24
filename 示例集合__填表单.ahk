;智慧环卫登录测试 ctrl+q
	^Q::
	send {F6}
	send {TEXT}javascript:
	Clipboard=
	(
	document.querySelector("#tb_UserName").value="jarry";
	document.querySelector("#tb_PassWord").value="1qaz2wsx";
	document.querySelector("body > div > div.loginContent > div.loginInput > div > div.login_from > div.login_button > a").click()
	)
	Send ^v
	Send {Enter}
	return

;自动登录oa
	::/oa:: 
	send {F6}
	send {TEXT}javascript:
	Clipboard=
	(
	document.querySelector("#tb_UserName").value="jarry";
	document.querySelector("#tb_PassWord").value="1qaz2wsx";
	document.querySelector("body > div > div.loginContent > div.loginInput > div > div.login_from > div.login_button > a").click()
	)
	Send ^v
	return