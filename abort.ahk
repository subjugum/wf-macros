/* * * * * Instructions * * * * *
 * Press F8 and it'll abort the mission. Only tested with 1080p.
 */
 
#SingleInstance force
SendMode Input
#IfWinActive Warframe

F8::
	WinGetPos,,, w, h, Warframe,,,
	x := w / 4.33
	y := h / 1.52
	Send {Esc}
	Sleep 300
	Click, %x%, %y%
	Sleep 100
	Send {Enter}
	Sleep 200
	Send {Enter}
return