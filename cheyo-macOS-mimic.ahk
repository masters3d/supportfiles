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

Ctrl & Tab:: AltTab
Ctrl & `::Send {LCtrl down}{Tab}{LCtrl up}

#If GetKeyState("Shift", "D")
; Tab back with special key below ESC
Ctrl & `::Send {Shift down}{LCtrl down}{Tab}{LCtrl up}{Shift up}
#if

; open Windows start on search similar to the finder in mac
Ctrl & Space::
    Send #s
    Send {WindowsKey up} ; workaround for sticky win
    return

;Command-backspace deletes whole line
Ctrl & BS::Send {LShift down}{Home}{LShift Up}{Del}

;alt-delete deletes previous word
Alt & BS::Send {LShift down}{LCtrl down}{Left}{LShift Up}{Lctrl up}{Del}

;Closing open tab
Ctrl & w::Send ^{F4}

; Hide the program
Ctrl & h::WinMinimize,a

; Quit a program
; TODO: It would be cool to make it ask if I am sure about closing a program like in Chrome
Ctrl & q::
    Send !{F4}
    Send {AltUp} ; workaround for sticky alt
    return

; Snapshots
+^4::Run %windir%\system32\SnippingTool.exe /clip
+^3::
    If (WinExist("Snipping Tool"))
    {
        WinActivate
        Send !{n}
        Send {AltUp} ; workaround for sticky alt
    }
    else 
    {
        Run %windir%\system32\SnippingTool.exe
        WinWait,"Snipping Tool",,1
        Send !{n}
        Send {AltUp} ; workaround for sticky alt
    }
    return
    
