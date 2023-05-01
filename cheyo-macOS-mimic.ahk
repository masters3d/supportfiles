; https://github.com/masters3d/supportfiles/blob/master/cheyo-macOS-mimic.ahk
; Save as UTF8-BOM !!!!

; UTF-8 will no render the special character correctly
; Originally found here:
;https://autohotkey.com/boards/viewtopic.php?t=12423
;Edited
; ! = ALT ; ^ = CTRL ; + = SHIFT ; # = WIN

; Left Alt and Left Windows are mapped to Left Control and Right Control
; Capstone was mapped to Left Alt. 

; Problems:
; https://autohotkey.com/board/topic/27064-alt-key-sticking/
; It is better to add a send {alt up} after sending alt. 
; This must be a windows thing related to accessability where you are able to press alt and it will turn the accessible mode on.  

; CMD + Shift + Tab ; ShiftAltTab doesn't not work with more than 2 hotkeys
; There is also some weird issues with modifiers on alt+tab mapped keys

; Windows keys sometimes are not recognized when send as {win} {some key}
; Work around is to send something like send #key

; Zoom in working similar in windows to the mac. 
; ALT + CTRL + Wheel zooms in or out but first you have to be in magnifier mode. 
; Magnifier mode can be activated with WindowsKey & + (plus sign)
; You want to have your step level at the lowest setting which is 25%
; Emoji keyboard can be triggered in windows with the WindowsKey & .

#InstallKeybdHook
#SingleInstance force
SendMode Input

XButton1::return
XButton2::return

; Get some sticky keys unstuck
#Escape:: 
    Send {LWinDown}{LWinUp}{RWinDown}{RWinUp} ; workaround for sticky win
    MsgBox, "WinKeyUp"
    return

^Escape:: 
    Send {CtrlDown}{CtrlUp} ; workaround for sticky control
    MsgBox, "CtrlKeyUp"
    return

!Escape:: 
    Send {AltDown}{AltUp} ; workaround for sticky Alt
    MsgBox, "AltKeyUp"
    return

Ctrl & Tab:: AltTab

; open Windows start to search similar to the finder in mac
Ctrl & Space::
    Send {RWinDown}{s}{RWinUp}
    return

; emoji shortcut
; change on the mac to match https://apple.stackexchange.com/a/230387
Ctrl & .::
    Send {RWinDown}{.}{RWinUp}
    return

; Hide the program
Ctrl & h::WinMinimize,a

;Closing open tab
Ctrl & w::
    Send ^{F4}
    Send {CtrlDown}{CtrlUp} ; workaround for sticky control
    return

; Quit a program
; TODO: It would be cool to make it ask if I am sure about closing a program like in Chrome
Ctrl & q::
    Send !{F4}
    Send {AltDown}{AltUp} ; workaround for sticky alt
    Send {CtrlDown}{CtrlUp} ; workaround for sticky control
    return

; This force to will delete a whole line 
Alt & BackSpace:: Send +{Delete}

#UseHook
; Save as UTF8-BOM
;https://autohotkey.com/board/topic/27801-special-characters-osx-style/
diacritic(map) {
    keyMap := "aeiounyAEIOUNY"
    Input c, I L1 T2, {LCtrl}{RCtrl}{LAlt}{RAlt}{LWin}{RWin}
    if (ErrorLevel != "Max")
    {
        return
    }
    ; get index from key map
    i := InStr(keyMap, c, true)
    ;MsgBox, % i
    if ( i > 0) ; 1 based index
    {
        c := SubStr(map, i, 1)
    }
    SendInput %c%
}

!e::diacritic("áéíóúnýÁÉÍÓÚNÝ")
!u::diacritic("äëïöünÿÄËÏÖÜNŸ")
!n::diacritic("ãeiõuñỹÃEIÕUÑỸ")
