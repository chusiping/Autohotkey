
getPngPath(snipaste_path){
    rt:=
    picDir:=snipaste_path
    ;edit：picDir:="D:\lvse\Snipaste_2.8.5Beta_64bit_Green\history\XOQ0DN\"
    uPicPath:="there is no pic in dir picture!"
    Loop, %picDir%\*.png
        FileList = %FileList%%A_LoopFileTimeModified%`t%A_LoopFileName%`n
    Sort, FileList  ;根据日期排序.从小到大
    Loop, parse, FileList, `n
    {
        if A_LoopField =  ; 忽略列表末尾的最后一个换行符(空项).
            continue
        StringSplit, FileItem, A_LoopField, %A_Tab%  ;用 tab 作为分隔符切割.
            
        ;RunWait, %picDir%\%FileItem2%
        FileSetAttrib, -R, %picDir%\%FileItem2%
        ;edit ：uPicPath=%picDir%\%FileItem2%       
        uPicPath=%FileItem2%  
    }
    rt:= picDir . uPicPath
    ; MsgBox, , tt, %rt%,  
    return rt
}
