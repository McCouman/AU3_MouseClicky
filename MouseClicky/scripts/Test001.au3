#region --- Au3Recorder generated code Start (v3.3.9.5 KeyboardLayout=00000407)  ---

#region --- Internal functions Au3Recorder Start ---
Func _Au3RecordSetup()
Opt('WinWaitDelay',100)
Opt('WinDetectHiddenText',1)
Opt('MouseCoordMode',0)
Local $aResult = DllCall('User32.dll', 'int', 'GetKeyboardLayoutNameW', 'wstr', '')
If $aResult[1] <> '00000407' Then
  MsgBox(64, 'Warning', 'Recording has been done under a different Keyboard layout' & @CRLF & '(00000407->' & $aResult[1] & ')')
EndIf

EndFunc

Func _WinWaitActivate($title,$text,$timeout=0)
	WinWait($title,$text,$timeout)
	If Not WinActive($title,$text) Then WinActivate($title,$text)
	WinWaitActive($title,$text,$timeout)
EndFunc

Func _MouseClick($recWidth, $recHeight, $x, $y)
	$testWidth = $recWidth - @DesktopWidth
	$testHeight = $recHeight - @DesktopHeight

	If $recWidth == @DesktopWidth Then
		MouseClick("left", $x, $y,1)
		Sleep(230)
	Else
		If $x > @DesktopWidth Then
			$newX = $x - $testWidth
		Else
			$newX = $x
		EndIf
		If $y < @DesktopHeight Then
			$newY = $y - $testHeight
		Else
			$newY = $y
		EndIf
		MouseClick("left", $newX, $newY,1)
		Sleep(230)
	EndIf
EndFunc

;_AU3RecordSetup()
#endregion --- Internal functions Au3Recorder End ---

;Record with width: 993 and height: 693

;Run('C:\Program Files\<>\application.exe')

;Start
_MouseClick(993,693, 28, 673)

;Paint Start
_MouseClick(993,693, 96, 315)

