#SingleInstance Force ; Allow only one running instance of script.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#MaxThreadsperHotkey 2 ; Default is 1 thread per hotkey, we need one more to toggle the Toggle
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
#IfWinActive Warframe

$CapsLock::
	Toggle := !Toggle
	
	While(Toggle) {
		Send x
		Sleep 1 ; Removing this is not recommended, altho I'm not sure how WF handles lots of inputs
	}
return
