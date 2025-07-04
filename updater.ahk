#Requires AutoHotkey v2.0 

updatepath := A_ScriptDir "\update"

Sleep 1000

if FileExist(updatepath "\AV_AIO.exe") {
    if FileExist(A_ScriptDir "\AV_AIO.exe"){
        FileDelete(A_ScriptDir "\AV_AIO.exe")
    }
    FileMove(updatepath "\AV_AIO.exe" , A_ScriptDir , true)
    Run(A_ScriptDir "\AV_AIO.exe")
}