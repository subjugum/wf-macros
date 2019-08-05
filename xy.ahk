#SingleInstance Force ; Allow only one running instance of script.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

#IfWinActive Warframe
$c::
	Loop {
		Send x
		Send y
		Sleep 1
		if(!GetKeyState("c", "P"))
			return
	}
return
