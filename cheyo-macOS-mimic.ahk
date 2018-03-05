; Originaly found here:
;https://autohotkey.com/boards/viewtopic.php?t=12423
;Edited

; Left Alt and Left Windows are mapped to Left Control and Right Control
; Capslock was mapped to Left Alt. 
#InstallKeybdHook
#SingleInstance force
SetTitleMatchMode 2
SendMode Input

Ctrl & Tab:: AltTab
; CMD + Shift + Tab ; ShiftAltTab doesn not work with more than 2 hotkeys
; There is also some weird issues with modifiers on alt+tab mapped keys
Ctrl & `::Send {LCtrl down}{Tab}{LCtrl up}

#If GetKeyState("Shift", "D")
; Tab back with special key below ESC
Ctrl & `::Send {Shift down}{LCtrl down}{Tab}{LCtrl up}{Shift up}
#if

; open Windows start with shortcut for Finder
Ctrl & Space::Send {RCtrl up}{LWin}

;Command-backspace deletes whole line
Ctrl & BS::Send {LShift down}{Home}{LShift Up}{Del}

;alt-delete deletes previous word
Alt & BS::Send {LShift down}{LCtrl down}{Left}{LShift Up}{Lctrl up}{Del}

;Closing windows and programs (using the Win Key)
Ctrl & w::Send ^{F4}
Ctrl & q::Send !{F4}
Ctrl & h::WinMinimize,a

; Snapshots
+^4::Run %windir%\system32\SnippingTool.exe /clip
+^3::
If (WinExist("Snipping Tool"))
{
	WinActivate
    Send !{n}
}
else 
{
	Run %windir%\system32\SnippingTool.exe
    WinWait,"Snipping Tool",,1
	Send !{n}
}
return
