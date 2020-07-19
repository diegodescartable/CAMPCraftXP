#SingleInstance 
CoordMode, Pixel, Window
global StartingBudget
SendMode, Input

; LEFT ALT + P - START SCRIPT  - Must be on build mode in the Blueprints tab, ensure your "XP Blueprint" is pleaceable and its foundation is in your aim
; LEFT ALT + Z - EXIT SCRIPT
; Tab, Z, C, E, Esc, Space - Abort script to avoid accidental scrapping since they are CAMP UI keys 


LogEnabled := false ;~ Controls if logging is done or not (can reduce running speed but helps for troubleshooting)

SwitchToF76(){
	IfWinExist Fallout76
	{
		WinActivate
		Sleep, 300
		StartingBudget := BudgetCheck()


	}
}		

mouseXY(x,y){
DllCall("mouse_event", "UInt", 0x01, "UInt", x, "UInt", y)
}

OnBuildMode(){
	XXX1 := 0
	PixelSearch, XXX1x, XXX1y, 86, 722, 86, 722, 0xFAE38E, 60 ,RGB
	If (ErrorLevel = 0){	
		XXX1 := 1
	}	
	XXX2 := 0
	PixelSearch, XXX2x, XXX2y, 49, 726, 49, 726, 0xE7DC9D, 60 ,RGB
	If (ErrorLevel = 0)	{
		XXX2 := 1
	}
	XXX3 := 0
	PixelSearch, XXX3x, XXX3y, 86, 716, 86, 716, 0xFAE38E, 60 ,RGB
	If (ErrorLevel = 0){	
		XXX3 := 1
	}
	If (XXX1 = 1 and XXX2 = 1 and XXX3 = 1)
	{
		return 1
	}
	else
	{
		return 0
	}
	
}

OnBlueprintsTab(){
	XXX1 := 0
	PixelSearch, XXX1x, XXX1y, 349, 60, 349, 60, 0xF8D877, 60, RGB
	If (ErrorLevel = 0){	
		XXX1 := 1
	}	
	XXX2 := 0
	PixelSearch, XXX2x, XXX2y, 394, 61, 394, 61, 0x010101, 60 ,RGB
	If (ErrorLevel = 0)	{
		XXX2 := 1
	}
	XXX3 := 0
	PixelSearch, XXX3x, XXX3y, 432, 63, 432, 63, 0xF7D675, 60 ,RGB
	If (ErrorLevel = 0){	
		XXX3 := 1
	}
	If (XXX1 = 1 and XXX2 = 1 and XXX3 = 1)
	{
		return 1
	}
	else
	{
		return 0
	}
	
}

OnStoredTab(){
	XXX1 := 0
	PixelSearch, XXX1x, XXX1y, 230, 63, 230, 63, 0xF9DE84, 60, RGB
	If (ErrorLevel = 0){	
		XXX1 := 1
	}	
	XXX2 := 0
	PixelSearch, XXX2x, XXX2y, 263, 61, 263, 61, 0x010101, 60 ,RGB
	If (ErrorLevel = 0)	{
		XXX2 := 1
	}
	XXX3 := 0
	PixelSearch, XXX3x, XXX3y, 292, 60, 292, 60, 0xF8D879, 60 ,RGB
	If (ErrorLevel = 0){	
		XXX3 := 1
	}
	If (XXX1 = 1 and XXX2 = 1 and XXX3 = 1)
	{
		return 1
	}
	else
	{
		return 0
	}
	
}
	
OnScrapFoundationDialog(){
	XXX1 := 0
	PixelSearch, XXX1x, XXX1y, 507, 433, 507, 433, 0xFAFAC7, 60, RGB
	If (ErrorLevel = 0){	
		XXX1 := 1
	}	
	XXX2 := 0
	PixelSearch, XXX2x, XXX2y, 528, 439, 528, 439, 0x0D0F0F, 60 ,RGB
	If (ErrorLevel = 0)	{
		XXX2 := 1
	}
	XXX3 := 0
	PixelSearch, XXX3x, XXX3y, 544, 435, 544, 435, 0xFFFFCB, 60 ,RGB
	If (ErrorLevel = 0){	
		XXX3 := 1
	}
	If (XXX1 = 1 and XXX2 = 1 and XXX3 = 1)
	{
		return 1
	}
	else
	{
		return 0
	}
	
}

OnScrapRoofDialog(){
	XXX1 := 0
	PixelSearch, XXX1x, XXX1y, 528, 446, 528, 446, 0xA9AA89, 60, RGB
	If (ErrorLevel = 0){	
		XXX1 := 1
	}	
	XXX2 := 0
	PixelSearch, XXX2x, XXX2y, 672, 329, 672, 329, 0xBC9D49, 60 ,RGB
	If (ErrorLevel = 0)	{
		XXX2 := 1
	}
	XXX3 := 0
	PixelSearch, XXX3x, XXX3y, 608, 371, 608, 371, 0x636451, 60 ,RGB
	If (ErrorLevel = 0){	
		XXX3 := 1
	}
	If (XXX1 = 1 and XXX2 = 1 and XXX3 = 1)
	{
		return 1
	}
	else
	{
		return 0
	}
	
}

SaveLog(message){
	If LogEnabled {
		FileAppend,	%A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% %message% `n, CAMPCraftXPLogs.txt
	}
	
}

AbortKeys(){
	SaveLog("CAMP Mode key manually pressed. Aborting!")
	ExitApp
}

MouseShake(){
	Sleep 200
	mouseXY(0,250)
	Sleep 200
	mouseXY(0,-250)
	Sleep 200
}

RoofOnAim(){
	XXX1 := 0
	PixelSearch, XXX1x, XXX1y, 1118, 201, 1118, 201, 0xF1F1C0, 60 ,RGB
	If (ErrorLevel = 0){	
		XXX1 := 1
	}	
	XXX2 := 0
	PixelSearch, XXX2x, XXX2y, 1137, 204, 1137, 204, 0xE5E5B7, 60 ,RGB
	If (ErrorLevel = 0)	{
		XXX2 := 1
	}
	XXX3 := 0
	PixelSearch, XXX3x, XXX3y, 1141, 227, 1141, 227, 0xF5F5C3, 60 ,RGB
	If (ErrorLevel = 0){	
		XXX3 := 1
	}
	If (XXX1 = 1 and XXX2 = 1 and XXX3 = 1)
	{
		return 1
	}
	else
	{
		return 0
	}
	
}

BudgetCheck(){
	PixelSearch, EmptyStartX,EmptyStartY, 1118, 129, 1245, 129, 0x2A2D2E, 60, RGB
	
	if ErrorLevel
		Budget := 100
	else
		Budget := Round((100/127) * (EmptyStartX - 1118),0)
	Return Budget
}

;---------------------------------------------------------------------------
StartScript() { 
;---------------------------------------------------------------------------
	SwitchToF76()
	sleep, 250
	
		

	Loop
	{

	;---------------------------
	; 1 Place Blueprint
		If (OnBlueprintsTab() = 0 )
		{
			SaveLog("ERROR: Blueprints Tab not found!!!")
			break
		}	
		
		PlaceBP:
		OldBudget := BudgetCheck()		
		SaveLog("Placing Blueprint,  Current Budget is " . OldBudget . "`%")
		
		
		Sleep 500
		SendInput {e Down}
		Sleep 150
		SendInput {e Up}
		Sleep 500
		
		Loop 50
		{	
			NewBudget := BudgetCheck()
			SaveLog("Current Budget is " . NewBudget . "`%. Waiting for Blueprint to be placed..")
			If ((NewBudget - OldBudget) > 5)
			{				
				SaveLog("Blueprint Placed")
				break
			}
			sleep 100
			sendInput {Tab Down}
			Sleep 100
			SendInput {Tab Up}
			sleep 250
			sendInput {Tab Down}
			Sleep 100
			SendInput {Tab Up}
			sleep 250	
		}
		
		NewBudget := BudgetCheck()
		If ((NewBudget - StartingBudget) < 5)
		{
			SaveLog("--ERROR-- Blueprint could not be placed!! Retrying...")
			Goto, PlaceBP
		}
			
		
	;---------------------------
	; 2 Go To Modify and Scrap Roof
		
		
		SaveLog("Switching to Modify Mode")
		Loop 50 
		{
			sendInput {Tab Down}
			Sleep 100
			SendInput {Tab Up}
			sleep 250
			SaveLog("Waiting for Modify mode..")		
			If (OnBuildMode() = 0) 
			{
				SaveLog("Modify Mode Found")
				break
			}
		}
		
			
		If (OnBuildMode() = 1) 
		{
			SaveLog("--ERROR-- Modify mode not found!!!")
			break
		}
		
		Scrap:
		OldBudget := BudgetCheck()		
		SaveLog("Removing Roof,  Current Budget is " . OldBudget . "`%")
		
		SaveLog("Opening Scrap Dialog")
		
		
		SendInput {r Down}
		Sleep 100
		SendInput {r Up}
		Sleep 250

		Loop 100
		{			
			sleep 100
			SaveLog("Waiting for Scrap dialog..")
			If (OnScrapRoofDialog() = 1)
			{
				SaveLog("Scrap dialog Found")
				break
			}
		}
			

		SaveLog("Selecting scrap option")
		SendInput {Space Down}
		Sleep 100
		SendInput {Space Up}
		Sleep 250
		
		Loop 50
		{	
			NewBudget := BudgetCheck()
			SaveLog("Current Budget is " . NewBudget . "`%. Waiting for Roof to be removed..")
			If ((OldBudget - NewBudget) > 5)
			{				
				SaveLog("Roof Removed")
				break
			}
			sendInput {Tab Down}
			Sleep 100
			SendInput {Tab Up}
			sleep 100
					
		}
		
		NewBudget := BudgetCheck()
		If ((NewBudget - StartingBudget) > 5)
		{
			SaveLog("--ERROR-- Roof could not be removed!! Retrying...")
			Goto, Scrap
		}
		
		
	;---------------------------
	; 3 Go To Stored and Scrap Items

		SaveLog("Switching to Build mode")
		Loop 50 
		{					
			SendInput {Tab Down}
			Sleep 100
			SendInput {Tab Up}
			sleep 250
			SaveLog("Waiting for Build mode...")
			If (OnBuildMode() = 1)
			{
				SaveLog("Build mode Found")
				break
			}
		}
		
		
		If (OnBuildMode() = 0) 
		{
			SaveLog("--ERROR-- Build mode not found!!!")
			break
		}		
		
		SaveLog("Moving to Stored Tab")
		SendInput {z Down}
		Sleep 100
		SendInput {z Up}
	
		Loop 50
		{			
			sleep 100
			saveLog("Waiting for Stored Tab...")
			If (OnStoredTab() = 1 )
			{
				saveLog("Stored Tab Found!!!")
				break
			}
		}
	
		
		If (OnStoredTab() <> 1 ) {
		SaveLog("--ERROR-- Stored tab not found!!!")
		break
		}
		
		SaveLog("Scrapping Items 50 times")
		
		Loop 50
		{
			SendInput {r Down}
			Sleep 35
			SendInput {r Up}
			Sleep 20
			SendInput {Space Down}
			Sleep 35
			SendInput {Space Up}
			Sleep 30
		}

		SaveLog("Items Scrapped")
		
		Sleep 500

	;---------------------------
	; 4 Go back to Blueprints tab and start over
		
		SaveLog("Moving to Blueprints Tab")
		
		Loop 50
		{

			SendInput {c Down}
			Sleep 100
			SendInput {c Up}
			Sleep 150
			
			SaveLog("Waiting for Blueprints Tab...")
			If (OnBlueprintsTab() = 1 )
			{
				break
			}
			
			;~ This is an extra tab in case the Scrap Mat dialog is still displayed
			SendInput {Tab Down}
			Sleep 100
			SendInput {Tab Up}
			Sleep 150
			
			
		}
		Sleep 250

		
		If (OnBlueprintsTab() <> 1 ) {
		SaveLog("--ERROR-- Blueprints tab not found!!!")
		break
		}
		SaveLog("Starting Again")

	}
}








!p::StartScript()



!z::ExitApp

$Tab::AbortKeys()
$Z::AbortKeys()
$C::AbortKeys()
$E::AbortKeys()
$Esc::AbortKeys()
$R::AbortKeys()
$Space::AbortKeys()