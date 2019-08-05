/* * * * * Instructions * * * * *
 * Go into Operator and press F2 in front of an item. 
 * You will now be in your frame, with the op carrying the item.
 */

#SingleInstance Force ; Allow only one running instance of script.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#MaxThreadsperHotkey 2 ; Default is 1 thread per hotkey, we need one more to toggle the Toggle
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

#IfWinActive Warframe
$F2::
	Send {x down}
	Send {5 down}
	Send {x up}
	Send {5 up}
return
