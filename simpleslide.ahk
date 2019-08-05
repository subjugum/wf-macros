/* * * * * Instructions * * * * *
 * Capslock             Slide attack while pressed
 * RCtrl + Arrow Keys   Adjusts attack speed
 * RCtrl + Esc          Close script
 * LAlt + B             Pause script
 * LAlt + R             Reload script
 */

#SingleInstance force
SendMode Input
#IfWinActive Warframe

attackDelay := 600

; Change the hotkey on the next two lines. Reference: https://autohotkey.com/docs/Hotkeys.htm
Capslock::
	while GetKeyState("Capslock", "P") {
		send {w down}
		send {shift down}
		sleep 50
		send ^e
		sleep attackDelay - 50
	}
	send {shift up}
	send {w up}
return

; Timed ToolTip
timedTT(text)
{
	ToolTip, %text% , 280, 30
	SetTimer, RemoveTT, 1750
	return
}

; Removing Tooltip Function
RemoveTT:
{
	ToolTip
	SetTimer, RemoveTT, Off
	return
}

>^Up::
	attackdelay += 100
	timedTT(attackDelay)
return

>^Right::
	attackdelay += 10
	timedTT(attackDelay)
return

>^Down::
	if (attackdelay >= 200)
		attackdelay -= 100
	timedTT(attackDelay)
return

>^Left::
	if (attackdelay >= 110)
		attackdelay -= 10
	timedTT(attackDelay)
return

; Close script
>^Esc::
	ExitApp
return

; Pause script
<!B::
	Pause
return

; Reload script
<!R::
	Reload
return