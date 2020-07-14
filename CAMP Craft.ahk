CoordMode, Pixel, Window
global AtBlueprintsTab, AtStoredTab, Step

; LEFT ALT + P - START SCRIPT  - Must be on build mode in the Blueprints tab, ensure your "XP Blueprint" is pleaceable and its foundation is in your aim
; LEFT ALT + Z - EXIT SCRIPT
; Tab, Z, C, E, Esc, Space - Abort script to avoid accidental scrapping since they are CAMP UI keys


SwitchToF76(){
	IfWinExist Fallout76
	{
		WinActivate
		Sleep, 300
	}
}		

OnBuildMode(){
	XXX1 := 0
	PixelSearch, XXX1x, XXX1y, 86, 722, 86, 722, 0x191D1D, 60,RGB
	If (ErrorLevel = 0){	
		XXX1 := 1
	}	
	XXX2 := 0
	PixelSearch, XXX2x, XXX2y, 49, 726, 49, 726, 0x191D1E, 60 ,RGB
	If (ErrorLevel = 0)	{
		XXX2 := 1
	}
	XXX3 := 0
	PixelSearch, XXX3x, XXX3y, 86, 716, 86, 716, 0xFAE38E, 60 ,RGB
	If (ErrorLevel = 0){	
		XXX3 := 1
	}
	If (XXX1 <> 1 and XXX2 <> 1 and XXX3 <> 1)
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

SaveLog(message){
FileAppend,	%A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% %message% `n, CAMPCraftXPLogs.txt
}

AbortKeys(){
	SaveLog("CAMP Mode key manually pressed. Aborting!")
	ExitApp
}

;---------------------------------------------------------------------------
StartScript() { 
;---------------------------------------------------------------------------
	SwitchToF76()
	sleep, 100
		

	Loop
	{

	;---------------------------
	; 1 Place Blueprint

		If (OnBlueprintsTab() = 1 )
		{
			SendInput {e Down}
			Sleep 30
			SendInput {e Up}
			Sleep 1500
			SaveLog("Placing Blueprint")
		}
		else
		{
			SaveLog("ERROR: Blueprints Tab not found!!!")
			Break
		}	
	;---------------------------
	; 2 Go To Modify and Scrap Foundation
	
		SendInput {Tab Down}
		Sleep 30
		SendInput {Tab Up}
		Sleep 500
		
		If (OnBuildMode() = 0)
		{	
			SaveLog("Removing Foundation")
			
			SendInput {r Down}
			Sleep 30
			SendInput {r Up}
			Sleep 1500
			
			If (OnScrapFoundationDialog() = 1)
			{
				SendInput {Space Down}
				Sleep 30
				SendInput {Space Up}
				Sleep 500
				SendInput {Tab Down}
				Sleep 30
				SendInput {Tab Up}
				Sleep 30
				
				SaveLog("Foundation Scraped")	
			}
			else
			{
				SaveLog("ERROR: Scrap Foundation Dialog not found!!!")
				Break
			}
		}
		else
		{
			SaveLog("ERROR: Modify Mode not found!!!")
			Break
		}
		
	;---------------------------
	; 3 Go To Stored and Scrap Items
		
		SendInput {z Down}
		Sleep 30
		SendInput {z Up}
		Sleep 500	
		
		If (OnStoredTab() = 1 )
		{
			SaveLog("Scrapping Items 50 times")
			
			Loop 50
			{
				SendInput {r Down}
				Sleep 40
				SendInput {r Up}
				Sleep 40
				SendInput {Space Down}
				Sleep 40
				SendInput {Space Up}
				Sleep 40
			}

			SaveLog("Items Scrapped")
			Sleep 2000
		}
		else
		{
			SaveLog("ERROR: Stored Tab not found!!!")
			Break
		}	
	;---------------------------
	; 4 Go back to Blueprints tab and start over
		
		SendInput {c Down}
		Sleep 30
		SendInput {c Up}
		Sleep 30	
		
		If (OnBlueprintsTab() = 1 )
		{
			SaveLog("Starting Again")
		}
		else
		{
			SaveLog("ERROR: Blueprints Tab not found!!!")
			Break
		}
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