#SingleInstance Force
#Include E:\____dropbox__Sync\Dropbox\配置文件中转站\AutoHotkey\AutoHotkey菜单.ahk


RControl::Run, explore C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Recent

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
	/ssh::
	/gp::
	/xiazai::
	/txvps::
	/hosts::
	/sj::
	/jd::
	/xigua::
	/yt::
	/tt::
	/con::
	/find::
	/ps::
	/cls::
	/fuwu::
	/duankou::
	/duankou::
	/find::
	/kill::
	/ll::
	/release::
	/cpu::
	/memory::
	/rm::
	/screen::
	/jj::
	/fakao::
	/tan::
	/pip::
	/p35::
	/vhost::
	/promise::
	/php::
	/if::
	/nodejs::
	/cha::
	/reg::
	/cmd::
	/curl::
	/net ::
	/docker::
	/firewall::
	/df::
	/nmap::
	/ffmpeg::
	/dos::
	/find::
	/zero::
	/py::
	/google::
	/mklink::
	/link::
	/mongodb::
	/npm::
	/time::
	/form::
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

;===========  西瓜网WheelUp	==============
	!WheelUp::
		WinGetTitle, title, A
		If InStr(title,"西瓜视频")
			send , {right}　　
		else
			send , {ctrl}+{WheelUp}
		return
	return
	!WheelDown::
		WinGetTitle, title, A
		If InStr(title,"西瓜视频")
			send , {left}　　
		else
			send , {ctrl}+{WheelDown}
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

;################ markdown ############
#IfWinActive, ahk_exe Typora.exe
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
:*:/port::netstat -aultnp | grep 80  		;查看端口
:*:/port::netstat -aultnp | grep :80 | sort 	;查看端口排序
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

:*:/cha::
	clipboard = 
	(
一、菊花茶的功效与作用


菊花茶的功效与作用
药材性味：甘、苦，微寒。

功效作用：散风清热，平肝明目，清热解毒。用于风热感冒，头痛眩晕，目赤肿痛，眼目昏花，疮痈肿毒。

中医揭露：很多人都喜欢菊花茶加冰糖饮用，这种做法其实是错误的。菊花性微寒，加冰糖只会雪上加霜，对于阳虚体质的人来说更不适合。而且很多咽炎患者长期喝菊花茶以求缓解症状，这也是不科学的，对于体质偏虚寒者，如果一味地喝具有清热泻火功效的菊花茶，容易损伤正气，反而会加重咽炎症状。

二、茉莉花茶的功效与作用


茉莉花茶的功效与作用
药材性味：辛甘，温。

功效作用：理气，开郁，辟秽，和中。治下痢腹痛，结膜炎，疮毒。

中医揭露：现代人精神压力普遍过大，于是有的人寄希望于喝杯茉莉花茶达到凝神静心的目的，这其实是一种误区。因为茉莉花茶中含有咖啡因会使人短暂兴奋，过后反而加重烦躁情绪对身体不利。神经不好或者经常失眠的人更要少喝茉莉花茶。

三、桂花茶的功效与作用


桂花茶的功效与作用
药材性味：性辛，温。

功效作用：化痰，散瘀。治痰饮嘲咳，肠风血痢，疝瘕，牙痛，口臭。

中医揭露：由于桂花性辛，所以桂花茶乃至常见的桂花年糕等通常会加冰糖或者蜂蜜调味，因此高血压患者不适宜过多饮用，且桂花可治疗肠风血痢，因此大便干燥便秘者禁服。

四、金银花茶的功效与作用


金银花茶的功效与作用
药材性味：甘，寒。

功效作用： 清热解毒，疏散风热。用于痈肿疔疮，喉痹，丹毒，热毒血痢，风热感冒，温病发热。

中医点评：人们需要消炎解毒镇痛时，往往第一时间想到金银花茶，这原本没错，但是仅适合夏天使用，因金银花性寒凉，故而其他季节建议多选雏菊、金盏花等偏寒花草茶代替饮用。

五、百合花茶的功效与作用


百合花茶的功效与作用
药材性味：性微寒平，味甘微苦。

功效作用：润肺，清火，安神。治咳嗽，眩晕，夜寐不安，天疱湿疮。

中医点评：部分百合花是有毒性的，所以，不可自行食用，即使作为药用，也要严格按照医生的医嘱使用。

六、牡丹花茶的功效与作用


牡丹花茶的功效与作用
药材性味：性平，味苦淡。

功效作用：调经活血。

中医点评：牡丹花其实不适合长期泡服的，不然就会造成脾胃虚寒、大便溏泄、饮食减少，需要及时根据体质调整花茶种类，兼顾着喝以免出现副作用。

七、洛神花茶的功效与作用


洛神花茶的功效与作用
药材性味：味酸，性寒、凉。

功效作用：利尿，止咳，解酒毒，清热止渴，解暑降压；

中医点评：许多爱美女士喜欢饭后饮用洛神花茶达到减肥降脂的目的，这是不科学的，洛神花中含有大量有机酸，从而响消化吸收，甚至会造成饭后腹胀和不适感，增加肠胃负担。

八、金盏花的功效与作用


金盏花的功效与作用
药材性味：味酸、甘，性寒。

功效作用：利尿，发汗，兴奋，缓下，通经。

中医点评：金盏菊花茶其实本身是没有什么禁忌性的，但是金盏菊花茶和其他的菊花茶一样，都属于寒凉的饮品，因此，经期以及体质虚寒的人可不能多喝。最值得注意的是，金盏菊花茶忌与鱼类食用，不然有可能会造成中毒。

九、樱花茶的功效与作用


樱花茶的功效与作用
药材性味：甘、微苦，性平。

功效作用：调节血糖血脂、延缓衰老、增进皮肤光泽与弹性。

中医点评：作为泡出来最好看的花茶，樱花茶不光只有外表，早在94年便发现其富含“第二人参”之称的绞股蓝，因此在日本备受追捧。但并非所有品种的樱花都能食用，有很多人路边捡拾飘落的樱花便去泡茶，这都是存在安全隐患的，要喝樱花茶最好是去“樱花茶网”等专业渠道才更令人放心。

十、玫瑰花茶的功效与作用


玫瑰花茶的功效与作用
药材性味：甘、微苦，温。

功效作用：行气解郁，和血，止痛。用于肝胃气痛，食少呕恶，月经不调，跌扑伤痛。

中医点评：爱美女性拿玫瑰花茶当宝，但玫瑰花活血散淤的作用比较强，因此，除了月经不调的女性，月经量过多或甚至月经正常的女性，在经期也都最好不要饮用玫瑰花茶。

以上就是中药领域对常见10种花茶的功效与作用的介绍，虽然饮用花茶可以起到保健功效，但是有一点需牢记，食品毕竟不可替代药品，如有相关症状还须前往医院诊治，而且花茶多有活血化瘀功效，所以孕妇饮用前必须咨询专业人员，最后祝大家科学饮茶，喝出健康美丽！
	)
	Send ^v
	return 


:*:/reg::
	clipboard = 
	(
		var patt = /\$\d{6}\$/g;
	    var rt2 = rt.match(patt);
	    var rt3 = rt2.map(x=> x.replaceAll("$",""));
	)
	Send ^v
	return 


:*:/cmd::
	clipboard = 
	(
		reg add "HKLM\SOFTWARE\Microsoft\Command Processor" /v AutoRun /t REG_SZ /d "cd /d :\git_15home\puppeteer\express\gp涨幅天数排行"
		curl --proxy http://127.0.0.1:7890 www.google.com
		curl --socks5 http://127.0.0.1:7890 www.google.com
		set HTTP_PROXY=http://127.0.0.1:7890
		set HTTP_PROXY=https://127.0.0.1:7890
	)
	Send ^v
	return 


:*:/curl::
	clipboard = 
	(
		-A "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:32.0) Gecko/20100101 Firefox/32.0"
		-H "Content-Type: application/json" 
		-H "application/x-www-form-urlencoded"
		-H "multipart/form-data"
		-H "Content-Type: application/text" 
		-F 'P_code=cn_515030-ETF-,cn_512760-ETF-,cn_512880-ETF-'
		curl -b "oa2.txt" "https://oa.gzqiaoyin.com/wui/main.jsp"

		curl --cookie "从editCookie插件导出" "https://oa.gzqiaoyin.com/wui/main.jsp"

		curl --cookie "em_hq_fls=.....1654581252879" "http://myfavor.eastmoney.com/v4/webouter/as?appkey=d41d8cd98f00b204e9800998ecf8427e&cb=jQuery33103190186058732998_165458125273&g=1&sc=0`%24000968&_=1654581252879" --referer http://quote.eastmoney.com/

		curl -v -I --referer http://baidu.com --user-agent 'Chrome/54.0 (Windows NT 10.0)' http://baidu.com/ 

		curl --proxy http://127.0.0.1:7890 www.google.com
		curl --socks5 http://127.0.0.1:7890 www.google.com

	)
	Send ^v
	return 

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
		docker restart myrunoob
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
;=========== npm ==================
:*:/npm::
	clipboard = 
	(
	node -v && npm -v && vue -V
	npm prefix -g  //查看全局路径
	npm config ls 
	npm install -g @vue/cli-service
	yarn global bin  //查看 yarn 全局bin位置
	yarn global dir  //查看 yarn 全局安装位置
	npm list -g
	git config --global url."https://".insteadOf git://
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
	
;===========formMaking tab点击隐藏javascript代码
:*:/form::
	clipboard = 
	(
************** 语法 ***************************
var a = arguments[0];
console.log(a)
console.log(a.value)

this.getValue('sele1')
this.reset()
this.hide(['tb1']);
this.display(['tb1']);
this.$message.error("先勾选并同意服务协议");
this.$message.success("注册成功");
this.setData({ active: 1, amountStr: `<h2>${data.amount}元</h2>`})

**************  tab控件 ***************************
var tabValue = this.getValue('sele1');   //tab控件ID的选值 ： a1,a2,a3
var idx = "3";                          //tab页个数
var Num = tabValue.substring(tabValue.length - 1);        //取出a1阿拉伯数字
var tab内容项 = "qy"; //隐藏区域名称
var tabArr1 = [];
var tabArr2 = [];
for (let i = 1; i <= idx; i++) {
    if (i == Num) {
        tabArr1.push(tab内容项 + i);
        continue;
    }
    tabArr2.push(tab内容项 + i);
}
this.display(tabArr1);
this.hide(tabArr2);
console.log("显示：" + tabArr1.toString())
console.log("隐藏：" + tabArr2.toString())

**************  dropdownlist控件 ***************************
var tabValue = this.getValue('drp1'); 
if(tabValue==""){
	this.hide(['tb1']);
}else{
	this.display(['tb1']);
}
**************  提交 ***************************
var tabValue = this.getValue('drp1');
if(tabValue==""){
	
}
**************  校验规则(未测试) ***************************
this.setRules('input',[{required:true,message:'必须填写'}])
this.setOptions(['input'],{required:true})

**************  message提示  ***************************
this.getData().then((data) => {
    if (this.getValue("check").length) {
        this.$message.success("注册成功");
    } else {
        this.$message.error("先勾选并同意服务协议");
    }
});

this.$alert('您点击</br>了我', '提示',{dangerouslyUseHTMLString:true}).then(() => {
    console.log("bt");
    this.setData({
        name: '123'
    })
})

this.$confirm('您点击</br>了我', '提示',{dangerouslyUseHTMLString:true,type:'info'}).then(() => {
    console.log("bt");
    this.setData({
        name: '123'
    })
})
	
******************** 多级联 ********************
[
	{
		"value": "广东",
		"label": "广东",
		"children": [
			{
				"value": "广东 - 广州",
				"label": "广东 - 深圳"
			}
		]
	},
	{
		"value": "广西",
		"label": "广西",
		"children": [
			{
				"value": "广西 - 南宁",
				"label": "广西 - 贺州"
			}
		]
	},
	{
		"value": "浙江",
		"label": "浙江"
	}
]
	)
	Send ^v
	return 
	
	
	