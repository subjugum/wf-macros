; https://github.com/dlipchenko/AHKScripts/tree/master/Warframe
; Textbox instead of slider, start/reset buttons, display of how many cycles have been done
; -- uxx0

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance force
;note - using this script implies that you have read the disclaimer in the readme.md file located at https://github.com/dlipchenko/AHKScripts/tree/master/Warframe and agree with the conditions I've written there
;note 2 - this script requires you to run the game in windowed mode, or borderless full-screen. Running in fullscreen is not supported yet, but I will try to find a way to make it work when I have the time
toggle = 0
#MaxThreadsPerHotkey 3
CoordMode, Mouse, Relative
CoordMode, Pixel, Relative
TopLeftChecked = 0
TopRightChecked = 0
MidLeftChecked = 0
MidRightChecked = 0
BotLeftChecked = 0
BotRightChecked = 0
InfiniteChecked = 0
Amount = 1
CheckCounter = 0
LoopCounter = 0
ResW = 0
ResH = 0

; Thanks Nameless
WaitPixel(){
	counter = 0
	MouseGetPos, posX, posY
	loop {
		pixelgetColor, newcolor, %posX%, %posY%
		new = %newcolor%
		if(counter > 2) {
			counter = 0
			break
		} else if(new = old) {
			counter++
		}
		old = %new%
		sleep, 200
	}
}

Gui, +Owner  ; +Owner prevents a taskbar button from appearing.
Gui, font, cBlack W100 s8, Verdana
Gui, Add, Text,X10 Y10, Which items should I craft?
Gui, Add, Checkbox, gCheckChecks vTopLeftCheck X10 Y30, Top-left
Gui, Add, Checkbox, gCheckChecks vTopRightCheck X100 Y30, Top-right
Gui, Add, Checkbox, gCheckChecks vMidLeftCheck X10 Y50, Mid-left
Gui, Add, Checkbox, gCheckChecks vMidRightCheck X100 Y50, Mid-right
Gui, Add, Checkbox, gCheckChecks vBotLeftCheck X10 Y70, Bot-left
Gui, Add, Checkbox, gCheckChecks vBotRightCheck X100 Y70, Bot-right
Gui, Add, Text, X10 Y90, How many times?
Gui, Add, Edit, x10 y110 w80 vAmount, %Amount%
Gui, Add, Checkbox, gCheckChecks vInfinite x100 y114, Infinite?
Gui, Add, Button, gStart x10 y160 w80, Start
Gui, Add, Button, gReset x100 y160 w80, Reset
Gui, +ToolWindow
Gui, +AlwaysOnTop
Gui, Show, NA x0 yCenter w200 h200
Gui, +Resize

CheckChecks:
	GuiControlGet, TopLeftChecked,,TopLeftCheck
	GuiControlGet, TopRightChecked,,TopRightCheck
	GuiControlGet, MidLeftChecked,,MidLeftCheck
	GuiControlGet, MidRightChecked,,MidRightCheck
	GuiControlGet, BotLeftChecked,,BotLeftCheck
	GuiControlGet, BotRightChecked,,BotRightCheck
	GuiControlGet, InfiniteChecked,,Infinite
return

;the following section was used for debugging.
;F3::
;	MsgBox, TL: %TopLeftChecked%, TR: %TopRightChecked%, ML: %MidLeftChecked%, MR: %MidRightChecked%, BL: %BotLeftChecked%, BR: %BotRightChecked%, I: %InfiniteChecked%, S: %Amount%
;return

;F2::
;	WinGetPos, XWinPos, YWinPos, XXWidth, YYHeight, A
;	MsgBox, XX: %XX%, YY: %YY%, XXWidth: %XXWidth%, YYHeight: %YYHeight%
;return

Start:
	GoSub, F1
return

Reset:
	Reload
return

F1::
	GuiControl, Disable, Start
	Gui, Submit, Nohide

	CheckCounter := TopLeftChecked + TopRightChecked + MidLeftChecked + MidRightChecked + BotLeftChecked + BotRightChecked
	LoopCounter = 0
	Toggle := !Toggle

	if (CheckCounter = 0)
	{
		MsgBox, Select at least one craft box
		Toggle = 0
		GuiControl, Enable, Start
		return
	}

	Gui, Add, Text, x10 y140 w90, Crafted:
	Gui, Add, Text, x100 y140 w80 vLoopCounter, %LoopCounter%

	WinActivate, Warframe
	Click, 1, 1
	Sleep, 1000
	WinGetPos, , , ResW, ResH, A

	if (TopLeftChecked = 1) and (Toggle = 1)
	{
		MouseMove, ResW*0.3, ResH*0.325, 20
		WaitPixel()
		Send, {Enter}
		WaitPixel()
		Send, {Enter}
		WaitPixel()
	}
	if (TopRightChecked = 1) and (Toggle = 1)
	{
		MouseMove, ResW*0.7, ResH*0.325, 20
		WaitPixel()
		Send, {Enter}
		WaitPixel()
		Send, {Enter}
		WaitPixel()
	}
	if (MidLeftChecked = 1) and (Toggle = 1)
	{
		MouseMove, ResW*0.3, ResH*0.51, 20
		WaitPixel()
		Send, {Enter}
		WaitPixel()
		Send, {Enter}
		WaitPixel()
	}
	if (MidRightChecked = 1) and (Toggle = 1)
	{
		MouseMove, ResW*0.7, ResH*0.51, 20
		WaitPixel()
		Send, {Enter}
		WaitPixel()
		Send, {Enter}
		WaitPixel()
	}
	if (BotLeftChecked = 1) and (Toggle = 1)
	{
		MouseMove, ResW*0.3, ResH*0.695, 20
		WaitPixel()
		Send, {Enter}
		WaitPixel()
		Send, {Enter}
		WaitPixel()
	}
	if (BotRightChecked = 1) and (Toggle = 1)
	{
		MouseMove, ResW*0.7, ResH*0.695, 20
		WaitPixel()
		Send, {Enter}
		WaitPixel()
		Send, {Enter}
		WaitPixel()
	}
	TempNumber := 62000 - (3000 * CheckCounter)
	Sleep, %TempNumber%
	LoopCounter++
	GuiControl,, LoopCounter, %LoopCounter%
	While ((CheckCounter > 0) and ((InfiniteChecked = 1) or (LoopCounter < Amount)) and (Toggle = 1))
	{
		if (TopLeftChecked = 1)
		{
			if (Toggle = 0)
			{
				Break
			}
			MouseMove, ResW*0.3, ResH*0.325, 20
			WaitPixel()
			Send, {Enter}
			WaitPixel()
			Send, {Enter}
			WaitPixel()
			Send, {Enter}
			WaitPixel()
		}
		if (TopRightChecked = 1)
		{
			if (Toggle = 0)
			{
				Break
			}
			MouseMove, ResW*0.7, ResH*0.325, 20
			WaitPixel()
			Send, {Enter}
			WaitPixel()
			Send, {Enter}
			WaitPixel()
			Send, {Enter}
			WaitPixel()
		}
		if (MidLeftChecked = 1)
		{
			if (Toggle = 0)
			{
				Break
			}
			MouseMove, ResW*0.3, ResH*0.51, 20
			WaitPixel()
			Send, {Enter}
			WaitPixel()
			Send, {Enter}
			WaitPixel()
			Send, {Enter}
			WaitPixel()
		}
		if (MidRightChecked = 1)
		{
			if (Toggle = 0)
			{
				Break
			}
			MouseMove, ResW*0.7, ResH*0.51, 20
			WaitPixel()
			Send, {Enter}
			WaitPixel()
			Send, {Enter}
			WaitPixel()
			Send, {Enter}
			WaitPixel()
		}
		if (BotLeftChecked = 1)
		{
			if (Toggle = 0)
			{
				Break
			}
			MouseMove, ResW*0.3, ResH*0.695, 20
			WaitPixel()
			Send, {Enter}
			WaitPixel()
			Send, {Enter}
			WaitPixel()
			Send, {Enter}
			WaitPixel()
		}
		if (BotRightChecked = 1)
		{
			if (Toggle = 0)
			{
				Break
			}
			MouseMove, ResW*0.7, ResH*0.695, 20
			WaitPixel()
			Send, {Enter}
			WaitPixel()
			Send, {Enter}
			WaitPixel()
			Send, {Enter}
			WaitPixel()
		}
		TempNumber2 := 62000 - (3000 * CheckCounter)
		Sleep, %TempNumber2%
		LoopCounter++
		GuiControl,, LoopCounter, %LoopCounter%
	}
	Toggle = 0
return

; LALT + B to pause script
<!B::
	Pause
return

; RCTRL + Esc to close script
>^Esc::
	ExitApp
return