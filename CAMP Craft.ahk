CoordMode, Pixel, Window
global AtBlueprintsTab, AtStoredTab, Step

; LEFT ALT + P - START SCRIPT  - Must be on build mode in the Blueprints tab, ensure your "XP Blueprint" is pleaceable and its foundation is in your aim
; LEFT ALT + Z - EXIT SCRIPT
; Tab, Z, C, E, Esc, Space - Abort script to avoid accidental scrapping since they are CAMP UI keys
BlockInput, MouseMove

SwitchToF76(){
	IfWinExist Fallout76
	{
		WinActivate
		Sleep, 300
	}
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
FileAppend,	%A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% %message% `n, CAMPCraftXPLogs.txt
}

AbortKeys(){
	SaveLog("CAMP Mode key manually pressed. Aborting!")
	ExitApp
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
;---------------------------------------------------------------------------
StartScript() { 
;---------------------------------------------------------------------------
	SwitchToF76()
	sleep, 500
		

	Loop
	{

	;---------------------------
	; 1 Place Blueprint
		Sleep 500
		If (OnBlueprintsTab() = 1 )
		{
			
			SendInput {e Down}
			Sleep 40
			SendInput {e Up}
			Sleep 1500
			SaveLog("Placing Blueprint")
		}
		else
		{
			SaveLog("ERROR: Blueprints Tab not found!!!")
			break
		}	
	;---------------------------
	; 2 Go To Modify and Scrap Roof
		
		
		Loop 30 
		{					
			sendInput {Tab Down}
			Sleep 40
			SendInput {Tab Up}
			sleep 500
			If (OnBuildMode() = 0) 
			{
				break
			}
		}
		
			
		If (OnBuildMode() = 1) 
		{
			SaveLog("--ERROR-- Modify mode not found!!!")
			break
		}
		
		SaveLog("Scraping Roof")
			
		SendInput {r Down}
		Sleep 40
		SendInput {r Up}
		Sleep 500
		
		Loop 30
		{			

			sleep 100
			If (OnScrapRoofDialog() = 1)
			{
				break
			}
		}
		Sleep 500
		
		If (OnScrapRoofDialog() = 0)
		{
			SaveLog("--ERROR-- Scrap dialog not found!!!")
			break
		}
						
		SendInput {Space Down}
		Sleep 40
		SendInput {Space Up}
		
		Loop 30
		{			

			sleep 100
			If (RoofOnAim() = 0)
			{
				break
			}
		}
		sleep 250
		SaveLog("Roof Scraped")
								
					
	;---------------------------
	; 3 Go To Stored and Scrap Items

		SendInput {Tab Down}
		Sleep 40
		SendInput {Tab Up}
		
		Loop 30 
		{					
			SendInput {Tab Down}
			Sleep 40
			SendInput {Tab Up}
			sleep 250
			If (OnBuildMode() = 1)
			{
				break
			}
		}
		Sleep 250
		
		If (OnBuildMode() = 0) 
		{
			SaveLog("--ERROR-- Build mode not found!!!")
			break
		}		
		
		SendInput {z Down}
		Sleep 40
		SendInput {z Up}
	
		Loop 30
		{			
			sleep 100
			If (OnStoredTab() = 1 )
			{
				break
			}
		}
		Sleep 250
		
		If (OnStoredTab() <> 1 ) {
		SaveLog("--ERROR-- Stored tab not found!!!")
		break
		}
		
		SaveLog("Scrapping Items 50 times")
		
		Loop 50
		{
			SendInput {r Down}
			Sleep 50
			SendInput {r Up}
			Sleep 50
			SendInput {Space Down}
			Sleep 50
			SendInput {Space Up}
			Sleep 50
		}

		SaveLog("Items Scrapped")
		
		Sleep 1000

	;---------------------------
	; 4 Go back to Blueprints tab and start over
		
		SendInput {c Down}
		Sleep 40
		SendInput {c Up}
		Sleep 40	
		
		

		Loop 30
		{			
			sleep 100
			If (OnBlueprintsTab() = 1 )
			{
				break
			}
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