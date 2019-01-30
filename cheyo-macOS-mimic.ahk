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
SetTitleMatchMode 2
SendMode Input


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

#If GetKeyState("Control", "D")
Ctrl & `::
    Send {LCtrl down}{Tab}{LCtrl up}
    return

#if

#If GetKeyState("Shift", "D")
; Tab back with special key below ESC
Ctrl & `::Send {Shift down}{LCtrl down}{Tab}{LCtrl up}{Shift up}
#if

; open Windows start on search similar to the finder in mac
Ctrl & Space::
    Send #s
    Send {LWinDown}{LWinUp}{RWinDown}{RWinUp}{CtrlDown}{CtrlUp}{AltDown}{AltUp} ; workaround for sticky win
    return

; emoji shortcut
; change on the mac to match https://apple.stackexchange.com/a/230387
Ctrl & .::
    Send #.
    Send {LWinDown}{LWinUp}{RWinDown}{RWinUp}{CtrlDown}{CtrlUp}{AltDown}{AltUp} ; workaround for sticky win
    return

; Win Maximize. Different from full screen.
; I tried full screen but could not figure out how to get our of full screen so I disabled it. 
<^>^f:: WinMaximize,a

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

; Snapshots
; This forced both left and right controls to be pressed. 
; This emulates the copy to pasteboard functionally of mac since I am using control as command in windows. 
; All command + control mac shortcut get mapped to requiring left and right command.
; This is faster than the windows 10 `win + shift + s` for some reason
<^>^+4::Run %windir%\system32\SnippingTool.exe /clip

; Does not seem to work when more than 3 keys are required. So this is a hack to to force it to pick the above one
; Plus I could not figure out a way to take a screenshot and save the screenshot to the desktop
^+4:: return

; non op when using both controls or Command + control in mac
<^>^+3::return

; Not exactly as macos since this is full screen capture in macos but close enough as it doesn't save to memory
+^3::
    If (WinExist("Snipping Tool"))
    {
        WinActivate
        Send !{n}
        Send {AltDown}{AltUp} ; workaround for sticky alt
        Send {CtrlDown}{CtrlUp} ; workaround for sticky control
    }
    else 
    {
        Run %windir%\system32\SnippingTool.exe
        WinWait,"Snipping Tool",,1
        Send !{n}
        Send {AltDown}{AltUp} ; workaround for sticky alt
        Send {CtrlDown}{CtrlUp} ; workaround for sticky control  
     }
    return

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

!+/:: Send ¿
!+1:: Send ¡
!1:: Send ¡

; Reverse the direction of the scroll for all devices
; Source https://superuser.com/a/310694/835694
#HotkeyInterval 1000
#MaxHotkeysPerInterval 500

$WheelUp::
;Send {WheelDown 1.5}
Send {WheelDown}
Return

$WheelDown::
;Send {WheelUp 1.5}
Send {WheelUp}
Return


; Chéyo's Personal Preference. Due to the way the layout is in my Sculpt keyboard I am always hitting these keys in error
; Delete::Send {BackSpace}

; This force to will delete a whole line 
Alt & BackSpace:: Send +{Delete}
Insert::Send {Enter}
PgDn:: Send {} ; Disable, Perhaps I could enable when I am using an external keyboard
PgUp:: Send {} ; Disable, Bad placement on laptop. 
