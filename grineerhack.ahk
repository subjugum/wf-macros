﻿/* * * * * Instructions * * * * *
 * Go in front of a console and press Capslock.
 */

#SingleInstance force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

#IfWinActive, Warframe

CapsLock::
^CapsLock:: ; To be able to hack while crouching
	SendInput x
	Delay(0.345)
	SendInput {Space}
	Delay(0.018)
	SendInput {Space}
	Delay(0.291)
	SendInput {Space}
	Delay(0.018)
	SendInput {Space}
	Delay(0.255)
	SendInput {Space}
	Delay(0.018)
	SendInput {Space}
	Delay(0.214)
	SendInput {Space}
	Delay(0.018)
	SendInput {Space}
return


Delay( D=0.001 ) { ; High Resolution Delay ( High CPU Usage ) by SKAN | CD: 13/Jun/2009
	Static F ; www.autohotkey.com/forum/viewtopic.php?t=52083 | LM: 13/Jun/2009
	Critical
	F ? F : DllCall( "QueryPerformanceFrequency", Int64P,F )
	DllCall( "QueryPerformanceCounter", Int64P,pTick ), cTick := pTick
	While( ( (Tick:=(pTick-cTick)/F)) <D ) {
		DllCall( "QueryPerformanceCounter", Int64P,pTick )
		Sleep -1
	}
	Return Round( Tick,3 )
}
