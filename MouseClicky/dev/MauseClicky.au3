#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=mouse-clicky.ico
#AutoIt3Wrapper_Res_Comment=MouseClicky 1.2
#AutoIt3Wrapper_Res_Description=Mouse Pointer for Desktop Automator by Michael Kaufmann
#AutoIt3Wrapper_Res_Fileversion=1.2.0.9
#AutoIt3Wrapper_Res_LegalCopyright=Copyright by Michael Kaufmann 2017
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#cs ----------------------------------------------------------------------------
	Version: 1.2.0.09 (Beta)
	Author:  Michael Kaufmann
	Script Function:
	MousClicky Helper for Desktop Automation
#ce ----------------------------------------------------------------------------

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <Misc.au3>
#include <MsgBoxConstants.au3>

Global $Version = 1.2

;start gui
MouseClicky_GUI()


Func MouseClicky_GUI($Version)
	; Sets the coord mode to use absolute screen coordinates
	Opt("MouseCoordMode", 1)

	#Region ### START Koda GUI section ### Form=C:\Users\McCouman\Desktop\MyAutomator\automator.kxf
	$Form1_1 = GUICreate("Mause Clicker", 458, 149, 327, 225, -1, BitOR($WS_EX_APPWINDOW, $WS_EX_CONTEXTHELP))
	$Menu = GUICtrlCreateMenu("Menu")
	$MenuInfo = GUICtrlCreateMenuItem("Info", $Menu)
	$MenuExit = GUICtrlCreateMenuItem("Exit" & @TAB & "Ctrl+Del", $Menu)
	$Help = GUICtrlCreateMenu("Help")
	$HelpListDeactive = GUICtrlCreateMenuItem("List dective", $Help)
	$HelpListActive = GUICtrlCreateMenuItem("List active", $Help)

	$LabelX = GUICtrlCreateLabel("X", 8, 8, 11, 17)
	$MouseX = GUICtrlCreateLabel("0000", 8, 24, 34, 17)

	$LabelY = GUICtrlCreateLabel("Y", 56, 8, 11, 17)
	$MouseY = GUICtrlCreateLabel("0000", 56, 24, 34, 17)

	$List = GUICtrlCreateEdit("", 120, 8, 329, 105, BitOR($ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $ES_WANTRETURN, $WS_VSCROLL))
	GUICtrlSetState($List, $GUI_DISABLE)

	$btnSave = GUICtrlCreateButton("Save", 8, 40, 105, 25)
	$btnCreate = GUICtrlCreateButton("Create Script", 8, 88, 105, 25)

	Dim $Form1_1_AccelTable[1][2] = [["^{DEL}", $MenuExit]]
	GUISetAccelerators($Form1_1_AccelTable)

	GUISetState(@SW_SHOW)
	#EndRegion ### END Koda GUI section ###

	Local $hDLL = DllOpen("user32.dll")

	While 1
		$nMsg = GUIGetMsg()

		;Mouse: actions
		If _IsPressed("01", $hDLL) Then ;key: "ctrl"
			Local $aPos = MouseGetPos()
			Sleep(20)
			If _IsPressed("11", $hDLL) Then
				GUICtrlSetData($MouseX, $aPos[0])
				GUICtrlSetData($MouseY, $aPos[1])
			EndIf
		EndIf


		Switch $nMsg
			Case $GUI_EVENT_CLOSE, $MenuExit
				Exit
			Case $HelpListActive
				GUICtrlSetState($List, $GUI_ENABLE)

			Case $HelpListDeactive
				GUICtrlSetState($List, $GUI_DISABLE)

			Case $btnSave
				;
				; save mouse positions an description data
				;
				Local $rDataX = GUICtrlRead($MouseX)
				Local $rDataY = GUICtrlRead($MouseY)
				Local $listD = GUICtrlRead($List)

				;update listner
				$listUpdate = ClickDescription($listD, $rDataX, $rDataY)
				GUICtrlSetData($List, $listUpdate)

			Case $btnCreate
				;
				; render desktop script for mouse automation
				;
				$FileFolder = @ScriptDir & "\scripts"
				If Not FileExists($FileFolder) Then
					DirCreate($FileFolder)
				EndIf

				$FileTestName = $FileFolder &"\"& CreateFile()
				If Not FileExists($FileTestName) Then
					$header = "#region --- Au3Recorder generated code Start (v3.3.9.5 KeyboardLayout=00000407)  ---" & @CRLF & _
							"" & @CRLF & _
							"#region --- Internal functions Au3Recorder Start ---" & @CRLF & _
							"Func _Au3RecordSetup()" & @CRLF & _
							"Opt('WinWaitDelay',100)" & @CRLF & _
							"Opt('WinDetectHiddenText',1)" & @CRLF & _
							"Opt('MouseCoordMode',0)" & @CRLF & _
							"Local $aResult = DllCall('User32.dll', 'int', 'GetKeyboardLayoutNameW', 'wstr', '')" & @CRLF & _
							"If $aResult[1] <> '00000407' Then" & @CRLF & _
							"  MsgBox(64, 'Warning', 'Recording has been done under a different Keyboard layout' & @CRLF & '(00000407->' & $aResult[1] & ')')" & @CRLF & _
							"EndIf" & @CRLF & _
							"" & @CRLF & _
							"EndFunc" & @CRLF & _
							"" & @CRLF & _
							"Func _WinWaitActivate($title,$text,$timeout=0)" & @CRLF & _
							"	WinWait($title,$text,$timeout)" & @CRLF & _
							"	If Not WinActive($title,$text) Then WinActivate($title,$text)" & @CRLF & _
							"	WinWaitActive($title,$text,$timeout)" & @CRLF & _
							"EndFunc" & @CRLF & _
							"" & @CRLF & _
							"Func _MouseClick($recWidth, $recHeight, $x, $y)" & @CRLF & _
							"	$testWidth = $recWidth - @DesktopWidth" & @CRLF & _
							"	$testHeight = $recHeight - @DesktopHeight" & @CRLF & _
							"" & @CRLF & _
							"	If $recWidth == @DesktopWidth Then" & @CRLF & _
							'		MouseClick("left", $x, $y,1)' & @CRLF & _
							"		Sleep(230)" & @CRLF & _
							"	Else" & @CRLF & _
							"		If $x > @DesktopWidth Then" & @CRLF & _
							"			$newX = $x - $testWidth" & @CRLF & _
							"		Else" & @CRLF & _
							"			$newX = $x" & @CRLF & _
							"		EndIf" & @CRLF & _
							"		If $y < @DesktopHeight Then" & @CRLF & _
							"			$newY = $y - $testHeight" & @CRLF & _
							"		Else" & @CRLF & _
							"			$newY = $y" & @CRLF & _
							"		EndIf" & @CRLF & _
							'		MouseClick("left", $newX, $newY,1)'& @CRLF & _
							"		Sleep(230)" & @CRLF & _
							"	EndIf" & @CRLF & _
							"EndFunc" & @CRLF & _
							"" & @CRLF & _
							";_AU3RecordSetup()" & @CRLF & _
							"#endregion --- Internal functions Au3Recorder End ---" & @CRLF & _
							"" & @CRLF & _
							";INFO: Recording with desktop width: " & @DesktopWidth & " and height: " & @DesktopHeight & @CRLF & _
							"" & @CRLF & _
							";You can start a supported application with run:" & @CRLF & _
							";Run('C:\Program Files\<>\application.exe')" & @CRLF & _
							"" & @CRLF & _
							";---------------- Your testcase comes here ----------------" & @CRLF & _
							"" & @CRLF

					FileWrite($FileTestName, $header)
					FileWriteLine($FileTestName, GUICtrlRead($List))
					MsgBox(64, "Info", "File successfully created!")
				Else
					MsgBox(16, "Error", "File is exist!" & @CRLF & "Please rename the au3 file.")
				EndIf

		EndSwitch
	WEnd
	DllClose($hDLL)
EndFunc   ;==>Example



;
; Create a description for mouse events
;
; @List		read list data
; @x		position x | width
; @y		position y | hight
;
Func ClickDescription($List, $x, $y)
	#Region ### START Koda GUI section ### Form=C:\Users\McCouman\Desktop\Meine Tools\MyAutomator\FormClickDescription.kxf
	$FormClickDescription = GUICreate("Click Description", 251, 98, -1, -1)
	$iClickDescription = GUICtrlCreateInput("", 8, 32, 233, 21, $GUI_SS_DEFAULT_INPUT)
	$ButtonOk = GUICtrlCreateButton("&OK", 8, 64, 75, 25, $BS_NOTIFY)
	$ButtonCancel1 = GUICtrlCreateButton("&Cancel", 167, 64, 75, 25, $BS_NOTIFY)
	$labelDescription = GUICtrlCreateLabel("Description:", 8, 12, 60, 17, 0)

	GUISetState(@SW_SHOW)
	#EndRegion ### END Koda GUI section ###

	Local $listData = ""

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE, $ButtonCancel1
				WinSetState($FormClickDescription, "", @SW_HIDE)
				ExitLoop

			Case $ButtonOk
				Local $descCheck = GUICtrlRead($iClickDescription)
				If $descCheck == "" Then
					MsgBox(48, "Info", "Please enter a description")
				Else
					;Standard MouseClick:

					;$listData = $List & _
					;		";" & $descCheck & @CRLF & _
					;		'MouseClick("left", ' & $x & ', ' & $y & ',1)' & @CRLF & _
					;		'Sleep(230)' & @CRLF & _
					;		'' & @CRLF

					;New Function: _MouseClick()
					$listData = $List & _
							";" & $descCheck & @CRLF & _
							"_MouseClick(" & @DesktopWidth & "," & @DesktopHeight & ", " & $x & ", " & $y & ")" & @CRLF & _
							"" & @CRLF
					WinSetState($FormClickDescription, "", @SW_HIDE)
					ExitLoop
				EndIf
		EndSwitch
	WEnd

	Return $listData
EndFunc   ;==>ClickDescription

;
; GUI for create au file
;
Func CreateFile()
	#Region ### START Koda GUI section ### Form=c:\users\mccouman\desktop\meine tools\myautomator\formclickdescription.kxf
	$CreateFile = GUICreate("Create File", 251, 98, -1, -1)
	$iFileName = GUICtrlCreateInput("", 8, 32, 233, 21, $GUI_SS_DEFAULT_INPUT)
	$ButtonOk = GUICtrlCreateButton("&OK", 8, 64, 75, 25, $BS_NOTIFY)
	$ButtonCancel2 = GUICtrlCreateButton("&Cancel", 167, 64, 75, 25, $BS_NOTIFY)
	GUICtrlCreateLabel("Filename:", 8, 12, 90, 20, 0)
	GUISetState(@SW_SHOW)
	#EndRegion ### END Koda GUI section ###

	Local $returnFN = ""

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE, $ButtonCancel2
				WinSetState($CreateFile, "", @SW_HIDE)
				ExitLoop
			Case $ButtonOk
				Local $descFileName = GUICtrlRead($iFileName)
				If $descFileName == "" Then
					MsgBox(48, "Info", "Please enter a file name!")
				Else
					$returnFN = GUICtrlRead($iFileName) & ".au3"
					WinSetState($CreateFile, "", @SW_HIDE)
					ExitLoop
				EndIf

		EndSwitch
	WEnd
	Return $returnFN
EndFunc   ;==>CreateFile
