#Include FindTextClass.ahk
;https://www.autoahk.com/archives/41636

t1:=A_TickCount, Text:=X:=Y:=""

;审批人
Text1:="|<>*212$32.000000000000000000y0000zs000Tz0007zs003zy000zzk00Dzw003zz000zzk00Dzw003zy000TzU003zk000zs000Dy0003zU000zw000zzk07zzzs3zzzy0zzzzUDzzzs000000zzzzUDzzzs000000000000000000000000000U"

;角色
Text2:="|<>*152$81.0000000000000000000000000000000000000000000000000000000000000M0000000000002000k000000000zw0A000000000A101zs000000030M0E600000000s6040U0000000DzzXUA00000001M84Tzz0000000310UUEM0000000M8442300000003zzUUEM0000000M844230000000310Uzzs0000000M8440300000003zzUU000000000E84400k000000210Uk060000000k843zzU000000410U0000000001U1w000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004"

;添加
Text3:="|<>*163$63.000000000000000000000000000000000000000000000000000000400E0080000U01bz1000040046087s00U000U7wV00400Fzw8Y800U071814V00400ANU8Y81zzk16614V004001YM8Y800U01MUV4V004008pEMY800U014h24V00400NYgFbs00U038YaAV00400E40b48000023U8000000000000000000000000000000000000000000004"

;搜索
Text3_1:="|<>*215$55.000000000000000000003w00000007zU000000Dzw0000007kz0041007U7U02Ci07U1s010F03U0Q03s8U3k0700Fpk1k03U08280s01k04140Q00s02jy0C00Q030E07U0C02U801k0D00FzU0w0D008EE0D0DU044E07kDk021k01zzw011s00Dzz0361k01z7k00000001w00000000S0000000070000E"

;管理员
Text4:="|<>*156$71.000000000000000000000000401UA0000000A020E000000080DzzjvzkTzUE0G2E24MUk0zztaMk48l1U03064kU8FW3006000U0Ezw7zsA0DzzkV68A00M0E01buAE000k0Dzk24MVzzzzkM0U4Dz300300k108FW620601zy0E30A40A03040XzwM80M06001MA0kM0k0Dzw70M01w1U0M0Mk0k06Dzzkk0k1zzVk0001zzU000Q0000303000000000000000000000000000000000000000001"

;推送A
Texta:="|<>*163$57.000000000000000000000010UE000MAUA430003360Ukk1U0MME62A0Q0Drzs3zw3k0NkU00k0K03S400606M0OkUS0k0n037zsk60480OkU6zzlVU3a40k60AA1skU60k3zk37zskDUTy0MkU63630k3640lkQk30MkU6M0a0M3640k00k3UMzz/U0000C6027zy000000000000U"

;确定
Text5:="|<>*204$111.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyDzzlzzzzzzzzzzzzzznzzz7zzzzzzzzzzzz040T000Dzzzzzzzzzzs0U3s001zzzzzzzzzzzttwTDzzDzzzzzzzzzzzCD7tzztzzzzzzzzzzzlU03DzzDzzzzzzzzzzyS00Tzzzzzzzzzzzzzzk9nm0007zzzzzzzzzzw1CSE000zzzzzzzzzzzX803zszzzzzzzzzzzzsN00TD7zzzzzzzzzzzz39nntszzzzzzzzzzzzsNCSSD01zzzzzzzzzzzn9nnls0DzzzzzzzzzzyN00SD7zzzzzzzzzzzzn803Vszzzzzzzzzzzzy1CSQ77zzzzzzzzzzzzk1nn48zzzzzzzzzzzzySSQEk00zzzzzzzzzzzzXk2DU07zzzzzzzzzzzyyEnzz3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

;保存
Text6:="|<>*188$71.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwzzzznzzzzzzt01zzbzzzzzzaTnz000TzzzzAzbzwzzzzzzyNzDznzzzzzztnyTzU07zzzznU0zyTyDzzzz7ANzszszzzzyDszzlz3zzzzsTlzz3yTzzzzoU03w000zzzzty3zvDtzzzzzns7zyTnzzzzzbYLzwzbzzzzzCMbztzDzzzzyNlnznyTzzzzwbXnzb1zzzzztz7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"

Loop
{
       
    if (ok:=FindText(X, Y, 58-150000, 197-150000, 58+150000, 197+150000, 0, 0, Text1))
    {
        
        FindText().Click(X, Y, "L")
        mytip()
      
        Sleep , 800
        if (ok:=FindText(X, Y, 58-150000, 197-150000, 58+150000, 197+150000, 0, 0, Text2))
        {
          FindText().Click(X, Y, "L")
          mytip()
        }
        Sleep , 800
        ;添加
        if (ok:=FindText(X, Y, 58-150000, 197-150000, 58+150000, 197+150000, 0, 0, Text3))
        {
          FindText().Click(X, Y, "L")
          mytip()
        }
        Sleep , 1000
        isclick = 0
        loop{
            ;搜索
            if (ok:=FindText(X, Y, 58-150000, 197-150000, 58+150000, 197+150000, 0, 0, Text3_1))
            {
                isclick = 1
                FindText().Click(X, Y, "L")
                Sleep , 300
                send,{Tab}
                send,推送A
                mytip()
                Sleep , 500
        
                ;点击推送A
                if (ok:=FindText(X, Y, 58-150000, 197-150000, 58+150000, 197+150000, 0, 0, Texta))
                {
                  FindText().Click(X, Y, "L")
                  mytip()
                }
                Sleep , 500
              
                ;确定
                if (ok:=FindText(X, Y, 58-150000, 197-150000, 58+150000, 197+150000, 0, 0, Text5))
                {
                  FindText().Click(X, Y, "L")
                  mytip()
                }
                        Sleep , 800
                ;保存
                if (ok:=FindText(X, Y, 58-150000, 197-150000, 58+150000, 197+150000, 0, 0, Text6))
                {
                  FindText().Click(X, Y, "L")
                  mytip()
                }
            }
            if(isclick > 0 )
            {
                break 
            }
        }

       
    }
}

mytip(){
    ; MsgBox, 4096, Tip, % "Found:`t" Round(ok.Length())
      ; . "`n`nTime:`t" (A_TickCount-t1) " ms"
      ; . "`n`nPos:`t" ok[1].x ", " ok[1].y
      ; . "`n`nResult:`t<" (Comment:=ok[1].id) ">"
    for i,v in ok  
      if (i<=2)
        FindText().MouseTip(ok[i].x, ok[i].y)
}

FindText(ByRef x:="FindTextClass", ByRef y:="", args*)
{
  global FindTextClass
  if (x=="FindTextClass")
    return FindTextClass
  else
    return FindTextClass.FindText(x, y, args*)
}




