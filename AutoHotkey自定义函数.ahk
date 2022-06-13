;本地下载涨幅天数排行
    gpszl_run_local()
    {
    	run cmd
	    sleep 500
	    send {shift}
        send , e:{enter}
        send, cd "E:\git_15home\puppeteer\zhhw-nodejs"{enter}
        send, node gpszl_上涨率_断点续传.js 1
    }
;node gpszl_股票上涨率.js
    gpszl_run()
    {
        run cmd
        sleep 1000
        send {shift}
        send ,ssh root@redis.qy{enter}
        sleep 1000
        send, cd /root/NodeJsApp/zhhw-nodejs{enter} 
		send, rm -f download/*{enter} 
		sleep 300
        send, node gpszl_上涨率_断点续传.js 1
    }
;任务管理器
    run_taskmgr()
    {
        run cmd
        sleep 200
        send {shift}
        send ,taskmgr{enter}
    }
;node gpszl_股票 txt 数据下载
    gpszl_download()
    {
        run cmd
        send {shift}
        FormatTime, CurrentDateTime,, yyyy-MM-dd  
        sleep 500
        send {shift}
        clipboard = 
        (
        pscp -pw Qy@123456 root@redis.qy:/root/NodeJsApp/zhhw-nodejs/download/AllHistoryData_%CurrentDateTime%.txt E:\git_15home\puppeteer\express\gp涨幅天数排行\download\AllHistoryData_%CurrentDateTime%.txt
        )
        Send ^c
        Send ^v
    }
;腾讯vps
    txvps()
    {
        run cmd
        sleep 500
        send {shift}
        send,ssh root@121.4.43.207{enter}
    }
;127.0.0.1:3000
    node_web()
    {
    	run cmd
	    sleep 500
	    send {shift}
        send , e:{enter}
        send, cd "E:\git_15home\puppeteer\express\gp涨幅天数排行"{enter}
        send, node index.js
    }
;xiadan
    xiadan()
    {
        run "D:\海王星金融终端-中国银河证券\xiadan\xiadan.exe"
        sleep 4000
        send,761110
    }
 ;提取股票代码字符串
    stockcode()
    {
        arr := Array()
        Run C:\Windows\Notepad.exe
        sleep 1000
        Haystack:=clipboard 
        NeedleRegEx:="O)(\d{6})"
        Match := {Len: {0: 0}},  FoundPos := 1
        While (FoundPos := RegExMatch(Haystack, NeedleRegEx, Match, FoundPos + Match.Len[0]))       
        {   
            tr:=1
            for index, el in arr
            {   
                if(el = Match.Value(0) )
                {
                    tr:=0
                }
            }
            if(tr = 1)
            {
                arr.push(Match.Value(0))
                sendinput,% Match.Value(0) ","  ;Msgbox % Match.Value(0)
            } 
        }
    }   
;自动保存news数据库
    saveNewsDB()
    {
        CoordMode, ToolTip, Screen
        run C:\Program Files (x86)\PremiumSoft\Navicat Premium\navicat.exe
        sleep 5000 
        Click ,7 243 
        Click 2  ;ip
        sleep 800 
        click, 75 450
        Click 2 ;db
        sleep 800 
        click, 670 93
        sleep 800 
        Click, 538 180 
        sleep 1200 
        send, news_db_%A_YYYY%-%A_MM%-%A_DD%
    }
 ;自动保存typcho数据库
    saveTypchoDB()
    {
        CoordMode, ToolTip, Screen
        run C:\Program Files (x86)\PremiumSoft\Navicat Premium\navicat.exe
        sleep 5000 
        Click ,7 243 
        Click 2  ;ip
        sleep 800 
        click, 65 640
        Click 2 ;db
        sleep 800 
        click, 670 93
        sleep 800 
        Click, 538 180 
        sleep 1200 
        send, typcho_db_%A_YYYY%-%A_MM%-%A_DD%
    }   
;图片侦测点击
    ;ClickPicture("E:\____dropbox__Sync\Dropbox\配置文件中转站\AutoHotkey\侦测的图片目录\mysql_ip.png", 2, 6,true,false)
    ClickPicture(ImageFilePath,ClickCount:=1,Speed:=0,Return:=true,ShowError:=true){
        pos:=GetPicturePosition(ImageFilePath)
        if %pos%{
            posX:=pos[1]
            posY:=pos[2]
            ClickPosition(posX,posY,ClickCount,Speed,,Return)
            return [posX,posY]
        }else{
            if %ShowError% {
                MSGBOX 图片异常`n %ImageFilePath%
            }
            return false
        }
        
    }

    ClickPosition(posX,posY,ClickCount:=1,Speed:=0,CoordMode:="Screen",Return:=true){
        if (CoordMode="Relative"){
            CoordMode,Mouse,Screen
            MouseGetPos, posX_i, posY_i ;原來的滑鼠位置
            if %ClickCount%{
                MouseClick,,%posX%,%posY%,%ClickCount%,%Speed%,,R
            }else{
                MouseMove, %posX%, %posY%,%Speed%
            }
        ;若使用其他模式
        }else{
            CoordMode,Mouse,%CoordMode%
            MouseGetPos, posX_i, posY_i 
            if %ClickCount%{
                MouseClick,,%posX%,%posY%,%ClickCount%,%Speed%
            }else{
                MouseMove, %posX%, %posY%,%Speed%
            }
        }
        ;是否点击返回
        if %Return%{
            MouseMove, %posX_i%, %posY_i%,%Speed%
        }
        return
    }

    GetPicturePosition(ImageFilePath){
        gui,add,picture,hwndmypic,%ImageFilePath%
        controlgetpos,,,width,height,,ahk_id %mypic%
        CoordMode Pixel
        ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight,%ImageFilePath%
        CoordMode Mouse
        if %FoundX%{
            return [FoundX+width/2,FoundY+height/2]
        } else {
            MSGBOX 找不到图片`n %ImageFilePath%
            return FoundX
        }
    }
;自动添加自选股
    ;获取接口的自选股的代码子串600818,600769,002435,600077。。。。。。。
    getData()
    {
        whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
        whr.Open("GET", "http://win7.qy/vhost/custom/api_stock.php?fcname=get_bk2&code=bkzxg_%E8%87%AA%E9%80%89&showtype=1", true)
        whr.Send()
        whr.WaitForResponse()
        response := whr.ResponseText[1]
        return response
    }
    AutoAddMyStock()
    {
        data := getData()
        MsgBox % data
        MsgBox,4,,请将chrome浏览器调整到105比例`n`n再打开同花顺自选股web页面操作`n`n准备好了继续吗？
        IfMsgBox Yes
            forData(data)
        else
           return
        return
    }

    forData(arr)
    {
        StringSplit, arrNew, arr,`,
        Loop, %arrNew0%
        {
            str := arrNew%A_Index%
            sendinput,{text}%str%
            sleep  800
            click, 1644,464
            sleep  1200
            click, 1554,374
            sleep  600
            if( break_g = 1)
            {
                break_g := 0
                return
            }
        }
		MsgBox 操作完成
    }
    AutoAddMyStock_old_ok()
    {
        arr = %clipboard% 
        StringSplit, arrNew, arr,`,
        Loop, %arrNew0%
        {
            str := arrNew%A_Index%
            sendinput,{text}%str%
            sleep  800
            click, 1544,464
            sleep  1200
            click, 1554,374
            sleep  600
            if( break_g = 1)
            {
                break_g := 0
                return
            }
        }
    }
;保存自选股代码到blk文件
    SaveZXG_codeTo_BLK()
    {
        data := getData()
        MsgBox % data
        data2 := forData_toBLK(data)
        MsgBox,4,,是否将自选股代码到blk文件?？
        IfMsgBox Yes 
            SaveData_toBLK(data2)
        else
           return
        return
        ;MsgBox % data2
    }
    forData_toBLK(arr) {
        StringSplit, arrNew, arr,`,
        str:=  
        Loop, %arrNew0%
        {
            str0 := add_1or6(arrNew%A_Index%)
            str := str str0 "`n" 
        }
        return str 
    }
    SaveData_toBLK(arr)
    {
        FileDelete, D:\海王星金融终端-中国银河证券\T0002\blocknew\ZXG.blk
        FileAppend, %arr%, D:\海王星金融终端-中国银河证券\T0002\blocknew\ZXG.blk
        FileAppend, %arr%, C:\Users\Administrator\Desktop\自选股.sel
        tooltip 成功
        sleep 1000
        tooltip
        return 
    }
    add_1or6(str)
    {
        head := "0"
        firstStr := SubStr(str, 1, 1) 
        if(firstStr=6){
            head:= "1"
        }
        rt:= head str
        return rt
    }
    ;拷贝复制html
    CopyClipFile(filep)
    {
        FileRead, OutputVar, % filep
        if not ErrorLevel  ; 加载成功
        {
            MsgBox,4,, % "拷贝复制" . filep . "?" ？
            clipboard := OutputVar
            IfMsgBox Yes 
                Send ^v
            else
               return
            return
        }
        else
        {
            MsgBox % filep . "  error:文件不存在或错误" . ErrorLevel
        }
    } 
    
    
    
    
    