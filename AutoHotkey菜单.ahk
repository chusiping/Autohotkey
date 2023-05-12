#SingleInstance Force
#Include E:\____dropbox__Sync\Dropbox\配置文件中转站\AutoHotkey\AutoHotkey自定义函数.ahk

;二级菜单 腾讯主机服务
Menu, MyMenu,   Add
Menu, Submenu2, Add, 生成AllHistoryData.txt文件,   evt5
Menu, Submenu2, Add, addJQJK同花顺,    			evt3
Menu, Submenu2, Add, 定时爬取新闻,           ma10
Menu, Submenu2, Add, 查看新闻接口,           ma101
Menu, MyMenu,   Add, 腾讯主机服务, :Submenu2

;二级菜单 redis.qy
Menu, MyMenu, Add
;Menu, Submenu1,  Add, gpTop 本地爬取, 				evt0
;Menu, Submenu1, Add, gpTop 自动爬取, 				evt1
;Menu, Submenu1, Add, gpTop 数据下载, 				evt2
Menu, Submenu1, Add, xsheel登录redis.qy服务器,    	 evt4
Menu, MyMenu,   Add, linux, :Submenu1

Menu, MyMenu, Add, 保存到BLK文件,	 ma1
Menu, MyMenu, Add, 127.0.0.1:3000,   ma2
Menu, MyMenu, Add, 海王星下单,       ma3
Menu, MyMenu, Add, 股票代码提取,     ma4
Menu, MyMenu, Add, newDB保存   ,     ma5
Menu, MyMenu, Add, typechoDB保存,    ma6
Menu, MyMenu, Add, 保存同花顺自选股,   ma7
Menu, MyMenu, Add, 启动爬虫,   	 	 ma9
Menu, MyMenu, Add, 拷贝FormMakinghtml,	 ma11
Menu, MyMenu, Add, 管理东方财富等自选股,	 	ma12



return



evt0:
   gpszl_run_local() ;本地爬取
return

evt1:
   gpszl_run() ;node gpszl_股票上涨率.js
return

evt2:
    gpszl_download() ;node gpszl_股票 txt 数据下载
return

evt3:
    ;腾讯vps
    loginVps()
    send,sc-r add{enter}
return

evt5:
    ;每日生成排行榜
    loginVps()
    send,sc-r gp{enter}
    sleep 2000
return

evt4:
	run cmd
	sleep 1000
	send ,"d:\Program Files (x86)\NetSarang\Xshell 4\Xshell.exe" -url ssh://root:Qy@123456@redis.qy{enter}
	sleep 3000
	send,ls
return

ma12:
    do_zxg()
return

ma1:
    SaveZXG_codeTo_BLK()
return

ma2:
    node_web() ;127.0.0.1:3000,
return

ma3:
    xiadan()  ;海王星下单
return

ma4:
    stockcode()  ;股票代码提取
return

ma5:
    saveNewsDB()	;保存news数据库
return

ma6:
    saveTypchoDB()	;保存typcho数据库
return

ma7:
    AutoAddMyStock()	;自动保存自选股
return

ma9:
    run cmd
	sleep 1000
	send {shift}
	send, e:{enter}
	send,cd "E:\git_15home\puppeteer\news_spider\"{enter}
	send, node news_catch.js
return

ma10:
    loginVps()
    send,sc-r spider_news{enter}
return

ma101:
    loginVps()
    send,sc-r api_news{enter}
return

ma11:
	CopyClipFile("E:\git_15home\puppeteer\范例代码\原型设计-表单示例_微信接口示例.html")
return


#z::Menu, MyMenu, Show  ; 即按下 Win-Z 热键来显示菜单.


global break_g = 0
~Esc::
    break_g = 1
return

