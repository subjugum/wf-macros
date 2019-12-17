/* * * * * Instructions * * * * *
 * Made for low fps players
 * Go in front of a console and press Capslock.
 */

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance force

#IfWinActive, Warframe

CapsLock::
^CapsLock::
	SendInput x
	Delay(0.345)
	SendInput {Space}
	Delay(0.036)
	SendInput {Space}
	Delay(0.309)
	SendInput {Space}
	Delay(0.018)
	SendInput {Space}
	Delay(0.25)
	SendInput {Space}
	Delay(0.018)
	SendInput {Space}
	Delay(0.236)
	SendInput {Space}
	Delay(0.036)
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
