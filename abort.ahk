#SingleInstance force
#IfWinActive Warframe
SendMode Input

F8::
	WinGetPos,,, w, h, Warframe,,,
	x := w / 4.33
	y := h / 1.52
    Send {Esc}
    Sleep 300
    ;Click, 443, 709
    Click, %x%, %y%
    Sleep 100
	Send {Enter}
    Sleep 200
	Send {Enter}
return