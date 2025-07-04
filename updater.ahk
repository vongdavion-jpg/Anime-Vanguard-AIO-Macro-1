#Requires AutoHotkey v2.0

updatepath := A_ScriptDir "\update"
path_version := A_ScriptDir "\version.txt"
coor_path := A_ScriptDir "\data\Coordinate"

Sleep 1000

if FileExist(updatepath "\AV_AIO.exe") {
    if FileExist(A_ScriptDir "\AV_AIO.exe") {
        FileDelete(A_ScriptDir "\AV_AIO.exe")
    }
    FileMove(updatepath "\AV_AIO.exe", A_ScriptDir, true)
    a := StrSplit(FileRead(path_version), "`n", "`r")
    numberofmap2 := Integer(a[2])
    Loop numberofmap2 {
        if DirExist(updatepath "/Map" A_Index) {
            try {
                DirMove(updatepath "/Map" A_Index, coor_path, true)
            } catch {
                DirDelete(updatepath "/Map" A_Index, true)
            }
        } else {
            continue
        }
    }
    Run(A_ScriptDir "\AV_AIO.exe")
}