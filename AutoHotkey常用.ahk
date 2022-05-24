#SingleInstance Force
#Include E:\____dropbox__Sync\Dropbox\配置文件中转站\AutoHotkey\AutoHotkey菜单.ahk


:*:/list::
clipboard = 
(
固定键
	F1 F3 F4 		：F3 退格 F4 删除 F1 粘贴 tab键 回车
	右键双击 		：复制(通用)  删除（color wolf ）
	中键 			：粘贴
	`		 		：关闭(浏览器,sublime) 删除（word） 
    alt 1,2,3 		：谷歌搜索股票
快捷键
	ctrl + q 		：everything搜索
	ctrl + SPACE	: 空格
	ctrl + 1 		: font color="red"
	ctrl+shift+j 	: 运行 xiadan.exe
	ctrl+alt+m 		: 运行 任务管理器
	看相片右键		：相当于空格，暂停
热子串
	/gp	 			：登录ssh ，node gpszl_股票上涨率.js
	/find 			: centos命令find
	/ssh			: 登录ssh
	/xiazai			: 下载AllHistoryData_2021-11-10_1625.txt
	/sj				: 系统时间
	/ps
	/cls
	/fuwu
	/duankou
	/find
	/kill
	/ll
	/hosts			: 
	/release
	/cpu
	/memory
	/txvps
	/nmap
	/555
	/rm 
	/dock
)
Send, ^v
Return

;===========  nodejs块注释	==============
^+/::
    send ^c
    thisvar := clipboard
    thisvar := "/*`n" . thisvar . "`n*/"
    clipboard := thisvar
    send ^v
return


;===========  空格	==============
	^+SPACE::send,　　

;===========  任务管理器	==============
	^!m::
		run_taskmgr()
	return 

;;===========  chrome.exe	==============
#IfWinActive, ahk_exe chrome.exe
	^1::
	send,^c
	Sleep 50
	clipboard = %clipboard% 
	send,<font color="red" size="">%clipboard%</
	return
;===========  youtube快捷快退	==============
	2::
		WinGetTitle, title, A
		If InStr(title,"YouTube")
			send , {right 2}
		else
			send , 2
		return
	return
	1::
		If InStr(title,"YouTube")
			send , {left 2}
		else
			send , 1
		return
	return
#IfWinActive


;;===========  potplayer 	==============
#IfWinActive, ahk_class PotPlayer
	2::
		send , {right}
	return
	1::
		send , {left}
	return
#IfWinActive

;################银河证券交易############
^!j:: 
run "D:\海王星金融终端-中国银河证券\xiadan\xiadan.exe"
sleep 4000
send,761110
return

;################ gpszl_股票上涨率.js ############
:*:/ssh::
gpszl_run()
return 

;################ 热子串 命令行区域all ############
:*:/gp:: ssh root@redis.qy{enter}cd /root/NodeJsApp/zhhw-nodejs && node gpszl_股票上涨率.js{enter}node gpszl_股票上涨率.js
return

;===========下载
:*:/xiazai::
	gpszl_download()
return 


;===========腾讯vps
:*:/txvps::
txvps()
return 


;===========hosts
:*:/hosts::
clipboard = 
(
公司内网
	172.18.1.203 ng.face.com
	172.18.1.204 web1.face.com
	172.18.1.212 web2.face.com
	172.18.1.207 db.face.com
	172.18.1.208 redis.qy
	172.18.1.17 old.face.com

	192.168.1.144 win7.qy 
	192.168.1.16  host16.qy 
	192.168.1.145 host145.qy 

	172.18.1.191 web1.zhhw.qy
	172.18.1.192 web2.zhhw.qy
	172.18.1.193 web3.zhhw.qy
	172.18.1.194 web4.zhhw.qy

	172.18.1.195 mysql1.zhhw.qy
	172.18.1.196 mysql2.zhhw.qy
	172.18.1.197 mysql3.zhhw.qy
	172.18.1.198 mysql4.zhhw.qy
	172.18.1.199 mongodb1.zhhw.qy

	172.18.1.187 file1.zhhw.qy 
	172.18.1.188 file2.zhhw.qy
	172.18.1.189 file3.zhhw.qy

zerotier
	192.168.195.66 win7.qy 
	192.168.195.164 win10.qy
	192.168.195.98 host16.qy
公网
	121.4.43.207 tx.qy 
)
Send ^v
return 




;===时间
:*:/sj::
FormatTime, CurrentDateTime,, yyyy-M-d H:mm   
SendInput %CurrentDateTime%
return


;################ sublime专门设定 ############
#IfWinActive, ahk_exe sublime_text.exe
	`::
	send,^w
	return
#IfWinActive


;################ vs code专门设定 ############
#IfWinActive, ahk_exe Code.exe
	^w::
	send,^/
	return
#IfWinActive

;################ windows相片看视频 ############
#IfWinActive, ahk_exe ApplicationFrameHost.exe
	$RButton::
	{
		send {space}
	}
#IfWinActive


;-::_
;################ 快速给文件名加前缀 ############
#IfWinActive, ahk_exe Explorer.EXE
	-::_
	^$F2::
	send,{f2}{left}^v_{enter}
	return
#IfWinActive


;################ color wolf专门设定 ############
#IfWinActive, ahk_exe ColorWolf.exe
gnPressCount := 0
$RButton::
{
        gnPressCount += 1
        SetTimer, ProcSubroutine, Off
        SetTimer, ProcSubroutine, 300
        Return
}
ProcSubroutine:
{
        ; 在计时器事件触发时，需要将其关掉
        SetTimer, ProcSubroutine, Off
        If gnPressCount = 2
        {
            send {delete}
        }
        gnPressCount := 0
        Return
}
#IfWinActive
:*:/jd::石决明 site:jd.com{home}
:*:/xigua::文昭谈古论今 新唐人电视台 site:ixigua.com{home}
:*:/yt::文昭谈古论今 倪海厦 site:youtube.com{home}
:*:/tt::倪海厦 site:toutiao.com{home}
:*:/con::console.log(){left 1}
:*:/find::find / -name master
:*:/ps::ps -ef | grep http 					;查看进程
:*:/cls::clear								;清屏
:*:/fuwu::netstat -ntlp						;查看服务
:*:/duankou::netstat -aultnp | grep 80  		;查看端口
:*:/duankou::netstat -aultnp | grep :80 | sort 	;查看端口排序
:*:/find::find / -name master
:*:/kill::kill -9 xxx							;杀死进程
:*:/ll::ll -lh -t 								;大小时间倒序
:*:/release::cat /etc/redhat-release
:*:/cpu::lscpu
:*:/memory::free -m
:0*:555::<`%= ` %>{left 4}
:*:/rm::rm -f *  rm -rf xx @删除文件夹子
:*:/screen::screen -S nps【新建】`nscreen -r nps 【进入】`nscreen -S nps -X quit 【。。。】`nscreen -ls 【查看已有列表】`nscreen -wipe【清除】`nCtrl加a加d【离开】
:*:/jj::记忆:
:*:/fakao:: 关键字 site:zxlszx.com
:*:/tan:: 痰湿用药 => 花椒蜂蜜水  干姜白粥  半夏  苍术陪黄柏  
:*:/pip:: C:\Users\Administrator\AppData\Local\Programs\Python\Python35\Scripts\pip.exe
:*:/p35:: C:\Users\Administrator\AppData\Local\Programs\Python\Python35\python.exe
:*:/vhost:: http://win7.qy/vhost/Hui_admin/index.html 
:*:/promise::  return new Promise((resolve, reject) => {{}...{}});
:*:/php:: set path=%path%;E:\xampp\php\       php -S 127.0.0.1:3000;
:*:/if::if(){{}`n{down};{up}{up}{right}
:*:/nodejs::cd /nodeApp/zhhw-nodejs/download

:*:/net ::
	clipboard = 
	(
		https://wangchujiang.com/linux-command/c/netstat.html
		netstat -ntp | grep frp
		netstat -ntlp  @监听的中服务端口 l = listen
		netstat -ntep  @建立的中服务端口 e = esbilish
		netstat -ntep | grep 'ESTABLISHED'
		netstat -aultnp | grep ':80' | sort   @查看监听的端口
		netstat -n | awk '/^tcp/ {++state[$NF]} END {for(key in state) print key,"\t",state[key]}' @查看链接数
		netstat -nat|grep -i "80"|wc -l 		@统计80端口连接数
		netstat -na|grep ESTABLISHED|wc -l   	@统计已连接上的，状态为“established 
		netstat -na|grep ESTABLISHED|awk {print$5}|awk -F: {print$1}|sort|uniq -c|sort -r   @查出哪个IP地址连接最多,将其封了
		netstat -ntu | grep :80 | awk '{print $5}' | cut -d: -f1 | awk '{++ip[$1]} END {for(i in ip) print ip[i],"\t",i}' | sort -nr  @查看连接某服务端口最多的的IP地址
		netstat -anp|grep 8081 | grep LISTEN|awk '{printf $7}'|cut -d/ -f1  通过端口找进程ID
		netstat -ltnp | grep 28577    @通过pid查询端口号
	)
	Send ^v
	return 

:*:/docker::
	clipboard = 
	(	

		docker stop mongo:3.6
		docker system df  【查看空间】
		docker container rm 37330e42b298   【删除实例】
		docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"   【指定列显示】
		docker inspect redis   【查看ip】
		docker rmi <your-image-id> 【删除镜像】
		docker network ls
		docker inspect mongo:3.6
		docker-compose  -f docker-compose_nginx.yml  up -d
		docker exec -it mongo3.6 mongo admin 				【进入admin数据库】
		du -s /var/lib/docker/* | sort -nr 【查看空间占用】
		df -h
	)
	Send ^v
	return

:*:/firewall::
	clipboard = 
	(
		systemctl enable/disable firewalld.service						@设置开机启用/关闭防火墙
		systemctl start/stop/restart  firewalld.service                 @
		
		firewall-cmd --list-ports                                		@查看开放的端口		
		firewall-cmd --zone=public --add-port=80-90/tcp --permanent		@开启多个端口
		firewall-cmd --zone=public --remove-port=80/tcp --permanent		@删除
		firewall-cmd --reload                                    		@重启firewall
	)
	Send ^v
	return 

:*:/df::
	clipboard = 
	(
		df -hl 	查看磁盘剩余空间
		df -h 	查看每个根路径的分区大小
	)
	Send ^v
	return 
	
;===========nmap
:*:/nmap::
	clipboard = 
	(
		nmap www.mapked.com -p8024 【指定端口】
		nmap ip1 ip2 -pxx,xx,xxx,xxx-xxx 【指定端口】
		nmap 192.168.1.17 -p21,22,80,3389,3306,1433,8000-9000 【指定端口】
		nmap -sS -p 1-65535 -v 192.168.1.17 【全端口扫描】
		
	)
	Send ^v
	return 
	
;===========ffmpeg
:*:/ffmpeg::
	clipboard = 
	(

		【合并mp4】
		(for `%i in (*.mp4) do @echo file '`%i') > mylist.txt  【生成列表】
		ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp4    【合并】

		【flv转mp4】
		for /r ./ `%v IN (*) do (ffmpeg -i "`%~nxv" "`%~nv.mp4")
		
		【视频抽离mp3】
		ffmpeg -i "aaa.mkv" -vn -acodec copy "aaa.ac3"
		ffmpeg -i "input.mp4" -vn "output.mp3" 
	
		【mp4截图】
		@echo off
		set path=C:\Users\Administrator\Desktop\youtube-临时
		for /r `%path`% `%v IN (*.mp4) do (ffmpeg.exe -skip_frame nokey -i "`%~nv.mp4" -vsync 0 -vframes 1 -c:v mjpeg "`%~nv.jpg")
		
		【取首张截图】
		 for /r `%path`% `%v IN (*.mp4) do (ffmpeg.exe -skip_frame nokey -i "`%~nv.mp4" -vsync 0 -vframes 1 -c:v mjpeg "`%~nv.jpg")
		
		【转mp3】
		 for /r ./ `%v IN (*.mp4) do (ffmpeg -i "`%~nv.mp4" -vn "`%~nv.mp3")
	)
	Send ^v
	return 

;===========dos
:*:/dos::
	clipboard = 
	(
		set PATH=`%PATH`%;D:\Program Files\

		语法
		for `%a in (*.*) do echo `%a		【只显示文件】
		for /d `%a in (*.*) do echo `%a  	【/d只显示目录】
		for /r `%a in (*.*) do echo `%a  	【/r无穷深入遍历】
		for /l `%a in (1,2,8) do echo `%a 【/l计数step】

		--带序号批量修改文件名
		cmd /v:on
		@echo off && set n=0 & for `%a in (*.mp4) do set /a n+=1 & echo . `%a 改为 00246国经法精讲_!n!.mp4 && ren "`%a" "00246国经法精讲_!n!.mp4"



		@echo off
		set path=E:\temp\jpg\cut   
		for /r `%path`% `%v IN (*.jpg) do (echo `%~nv2.mp4)
		for /r ./ `%v IN (*) do (echo 在云上 > `%~nv_百度云上.txt)
		
		chcp 65001 就是换成UTF-8代码页 
		chcp 936 可以换回默认的GBK 
		find /N "银行" "E:\____dropbox__Sync\Dropbox\配置文件中转站\AutoHotkey\*.txt"
		
		用法参考 https://blog.csdn.net/caolaosanahnu/article/details/6978487
		`%~fI -将`%I扩充到一个完全合格的路径名
		`%~dI -仅将`%I扩充到一个驱动器号
		`%~pI -仅将`%I扩充到一个路径
		`%~nI -仅将`%I扩充到一个文件名
		`%~xI -仅将`%I扩充到一个文件延伸名
		`%~sI -扩充的路径只含有短名
		`%~aI -将`%I扩充到文件的文件内容
		`%~tI -将`%I扩充到文件的日期/时间
		`%~zI -将`%I扩充到文件的大小
		`%~$PATH:I -查找列在路径环境变数的目录，并将`%I扩充到找到的第一个完全合格的名称
		`%~dpI -仅将`%I扩充到一个驱动器号和路径
		`%~nxI -仅将`%I扩充到一个文件名和延伸名
		`%~fsI -仅将`%I扩充到一个带有短名的完整路径名
		`%~dp$PATH:i -查找列在路径环境变数的目录，并将`%I扩充到找到的第一个驱动器号和路径。
		`%~ftzaI -将`%I扩充到类似输出线路的DIR
	)
	Send ^v
	return 

;===========find
:*:/find::
	clipboard = 
	(
		chcp 65001 就是换成UTF-8代码页 
		chcp 936 可以换回默认的GBK 
		find /N "银行" "E:\____dropbox__Sync\Dropbox\配置文件中转站\AutoHotkey\*.txt"
	)
	Send ^v
	return 
	
;===========zerotier
:*:/zero::
	clipboard = 
	(
		zerotier-cli status
	)
	Send ^v
	return 

;===========python建立http服务器
:*:/py::
	clipboard = 
	(
		D:\Users\Administrator\AppData\Local\Programs\Python\Python310\python.exe -m http.server 3000
	)
	Send ^v
	return 
	
;===========google常用插件
:*:/google::
	clipboard = 
	(
		Greasy Fork: AC-baidu： 优化百度、搜狗、谷歌搜索结果之关键词自动高亮
		Greasy Fork: 派派助手
		Greasy Fork: 西瓜down
		Greasy Fork: Instant Multi Search 多引擎搜索
		Greasy Fork: youtube播放视频倍速自定义，可记忆
		Greasy Fork: 知乎增强
		Greasy Fork: 无缝自动翻页
		
		google常用插件
		Talkie: text-to-speech
		Adblock Plus - 免费的广告拦截器
		Holmes：浏览器书签搜索扩展程序 Chrome插件
		Vimium:书签管理工具
		Diigo Web Collector：碎片收集
		EditThisCookie：cookie
		Force Background Tab ： 强制标签在后台打开 
		Free Download Manager：下载
		JSON-handle：json
		JSONVue：json
		Postman Interceptor 1.1.2
		Pinbox - 跨平台收藏
		UI.Vision RPA 浏览器自动化工具
		页面自动刷新插件
		图片助手(ImageAssistant) 批量图片下载
		图流-看图助手
		User-Agent Switcher for Chrome：切换收集浏览器模式
		ScrollAnywhere ：关东
		Toby for Chrome0.7.12 ：标签管理
		Xtreme Download Manager：下载	
		Automa – 浏览器自动化扩展	
		XPath Helper
		Neater Bookmarks 0.9.7.1
	)
	Send ^v
	return 

;===========硬链接
:*:/mklink::
	clipboard = 
	(
		mklink "C:\Users\Administrator\AppData\Local\Programs\Python\Python35\Scripts\pip.exe" "E:\____dropbox__Sync\Dropbox\mklink\exe命令映射\pip.exe"
		mklink /d "e:\test_k" "f:\test"
		创建我的克隆
	)
	Send ^v
	return 
;===========centos 链接
:*:/link::
	clipboard = 
	(
		ln -s /root/nodeApp/zhhw-nodejs/download /root/nodeApp/express/gp涨幅天数排行/download
		rm -rf /root/nodeApp/express/gp涨幅天数排行/download
	)
	Send ^v
	return 
;===========每天
:*:/mongodb::
	clipboard = 
	(
		docker search mongo
		docker pull mongo:3.6
		docker images
		docker run --name mongodb3.6 -p 27017:27017 -v /docker/mongodb/data:/data/db -v /docker/mongodb/dump:/var/dump -d mongo:3.6 (正确打开方式) 
		docker rm 51c02b6a61bf
	)
	Send ^v
	return 
;===========centos 定时任务
:*:/time::
	clipboard = 
	(
		定时任务
		service crond start
		service crond stop 
		service crond restart 
		service crond reload
		service crond status
		10 17 * * * /root/sh/downStockCode.sh   //每天17点执行
		从左到右分别是分钟（0~59）小时（0~23）天（1~31）月(1~12)星期(0~6)、用户名、要执行的命令或者脚本。


		crontab -r 删除定时任务
		crontab -l  			//查看
		tail -f /var/log/cron 
		crontab -e             //编辑 
		crontab /etc/crontab  //保存生效
		cat /var/log/cron   //查看是执行
		i //insert 
		ESC + :wq
		service crond restart

		例子
		0 2 * * * /bin/sh backup.sh  //每天 02:00 执行任务
		*/10 * * * * /scripts/monitor.sh  
		* * * * *  /scripts/script.sh
		0 */4 * * * /scripts/script.sh //每四个小时执行一个任务
		* * * * *  sleep 30; /scripts/script.sh  //每个30秒执行一次任务
		* * * * * /scripts/script.sh; /scripts/scrit2.sh  //多个任务在一条命令中配置

		crontab -e #编辑cron任务模式
		i #默认文字编辑器为vim，按i字母键即可添加cron任务
		30 3 * * * /usr/local/etc/rc.d/lighttpd restart #将命令代码放入，此命令意义为每天的03:30 重启apache
		ESC #按ESC键退出编辑模式
		:wq #键入:wq保存
		service crond restart #重启crontab服务
	)
	Send ^v
	return 
	
	
	
	