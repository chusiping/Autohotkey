;1 找到列表主页
;2 循环所有列表，循环xy坐标定位 MouseMove, 200, 100
;3 打开第n页
;4 点击图标判断窗口下载
;5 循环
#Include debug.ahk
#Include FindTextClass.ahk





Func_下载完毕否(){
 Loop
 {
  	if not WinExist("ahk_exe IDMan.exe")
      break 
 }
 sleep,2000
 print("download is ok!")
 send,^w
 ; MsgBox, Tip, 下载完毕
}

Func_识别下载图标(){
  t1:=A_TickCount, Text:=X:=Y:=""
  rt:=0    
  Text:="|<>*140$96.00000000000000000000000000000000000370QC00Q00300Tzw37kC700ATsTTy0M0Tzs7zs06MMTlU0M037M0600zvMT3U0M0zzw0Ak03vMTDw0s0C70yxk03vMzwQ0y0C7QDzU07vM3Dw0zUzzMC7s0CzMTzw0tkTXsCCs0DzMTzw0skTzkCwk0zzsTzw0s03XkDlU0zzsnjw0s07vUC3k0C7U3jw0s0zbyDjs0CDg77s0M03Cy7QM0CTgCCQ0M03sQ0kA0CvwssCU"

;480 mp4
Text2:="|<>*130$174.zzzzzzzwzwyTzzzzzznDzzzzzzzzzbyS1zDzyzwqTzzzzzznCTzztwTVzzXySwzDs00RqTzzzzzznyTzztnjQzzXwSwyDzDntU3zzzzzznyTzzlnaQzzfxSywDzDntiTzy9bb1n81tzVnaym7dtSwxDzjrlCTzwlbbQnCRtzdviylnhvSwtDzbbVSTzttbbwnCQvz9wSynngnS3nDzrjdyTzttbbsnCQnyNnaynvirSzrDznTt01zvtbb4nCSrytrqynviLSzU3zsztyTzvtbaQnCSLw0Lqynvi7SzzDzwTtyTzttbawnCS7ztrqQnnjDSzzDznDtyTDtln6MnCTDztnbRlrjDSzzDyDltyTTw9kb0nD7DztsD3mDzzzzzzszwNyTTztzzzzzzDzzzzznzU"

 
  if (ok:=FindText(X, Y, 58-150000, 197-150000, 58+150000, 197+150000, 0, 0, Text))
  {
      print("ocr is success！")
      FindText().Click(X, Y, "L")
      rt:=1
      ; mytip()

  }
  if(rt:=1){
    sleep,1000
    if (ok2:=FindText(X, Y, 58-150000, 197-150000, 58+150000, 197+150000, 0, 0, Text2))
    {
      print("click download is success!")
      FindText().Click(X, Y, "L")
      sleep,500
      send,{enter}
      sleep,1000
      Func_下载完毕否()
    }
  }
}


Func_开始(){
  MsgBox, 点击开始批量下载
  Sleep,2000
  x:=542
  y:=405
  xmove:=300
  i:=0
  MouseMove, % x , % y
  Loop,4
  {
    i:=i+1
    new_x:=x+(i*xmove)
    print(" - " . new_x)
    Send, {Control down}
    MouseClick, left
    Send, {Control up}
    Sleep,1000
    Func_进入新窗口()
    MouseMove, new_x, y
    ; MouseMove, 300, 0, 5, R

  }
}

Func_开始2(){
  MsgBox, 点击开始批量下载
  Sleep,2000
  send,{Tab 3}
  Sleep,500
  ; send,{Tab}
  ; Sleep,200
  ; send,{Tab}
  ; Sleep,200
  Loop,8
  {
    i:=i+1
    Send, {Control down}
    Send, {enter}
    Send, {Control up}
    Sleep,500
    ; Func_进入新窗口()
    send, {tab}{tab}
    Sleep,500
  }
}




Func_进入新窗口(){
  Send, {Control down}
  Send,{Tab}
  Send, {Control up}
  sleep,4000
  Func_识别下载图标()
  sleep,1000
}


; Func_下载完毕否()
; Func_识别下载图标()
Func_开始2()

    
    