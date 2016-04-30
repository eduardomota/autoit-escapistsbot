; #INDEX# =======================================================================================================================
; Title .........: The Escapists Bot
; Version .......: 1.0
; AutoIt Version : 3.3.14.2
; Language ......: English
; Description ...: Small bot script to make the escapists easier
; Author(s) .....: Eduardo Mota
; Dll ...........: -
; ===============================================================================================================================

Global $workoutbot_active = 0, _	; Is Workout bot active
	   $autoclick_active = 0		; Is Autoclick active

_init()
While 1
	Sleep(1)	; Avoid excess CPU usage
WEnd

; Metal Workshop bot
Func workshopbot()
	_tooltip("Metal workshop bot started")
	For $i= 1 To 6 Step 1
		Sleep(100)
		Send($i)
		Send($i)
		Sleep(100)
		MouseClick("left")
		MouseClick("left")
		Sleep(100)
	Next
	_tooltip("Metal workshop bot ended")
Endfunc
	
; Workout bot switch
Func workoutbot()
	If $workoutbot_active = 0 Then
		$workoutbot_active = 1
		AdlibRegister("workoutbot_keys",39)
		_tooltip("Workout bot active")
	Else
		$workoutbot_active = 0
		AdlibUnRegister("workoutbot_keys")
		_tooltip("Workout bot inactive")
	EndIf
Endfunc

; Send Workout bot keys
Func workoutbot_keys()
	Send("q")
	Send("e")
Endfunc

; Autoclick switch
Func autoclick()
	If $autoclick_active = 0 Then
		$autoclick_active = 1
		AdlibRegister("autoclick_click",40)
		_tooltip("Autoclick bot active")
	Else
		$autoclick_active = 0
		AdlibUnRegister("autoclick_click")
		_tooltip("Autoclick bot inactive")
	EndIf
Endfunc

; Autoclicker click
Func autoclick_click()
	MouseClick("left") ; Do left click with autoclicker
Endfunc

; Define mouse tooltip text
Func _tooltip($sText = '')
	If $sText Then
		ToolTip($sText)
		AdlibRegister("_tooltip",1000) ; Delete message after 1000ms
	Else
		AdlibUnRegister("_tooltip")
		ToolTip("")
	Endif
Endfunc

; Initialize script base
Func _init()
	; Define optimal options for bot actions
	AutoItSetOption("SendCapslockMode",0)
	AutoItSetOption("SendKeyDelay",19)
	AutoItSetOption("SendKeyDownDelay",20)
	AutoItSetOption("MouseClickDelay",20)
	AutoItSetOption("MouseClickDownDelay",20)
	
	HotKeySet("{F6}","workshopbot")	; Workshop bot Hotkey
	HotKeySet("{F8}","workoutbot")	; Workout bot switch Hotkey
	HotKeySet("{F7}","autoclick")	; Autoclicker switch Hotkey
	HotKeySet("{F9}","_quit")		; Quit script Hotkey
Endfunc

; Quit Script
Func _quit()
	Exit
Endfunc