; Only allow one instance of the script to be ran at a time.
#SingleInstance, Force

; Paths to x64 and x86 versions for icon changing.
; Note that if you're running a portable version of AHK, the icon won't change.
x64Path := "C:\Program Files (x86)\AutoHotkey\AutoHotkey.exe"
x86Path := "C:\Program Files\AutoHotkey\AutoHotkey.exe"

; Sets default state of hotkeys to on.
toggle  := 1

return

; Hotkey
^SC027::
    ; Toggle flip flop
    toggle := !toggle

    ; If toggle is on
    if (toggle = 1){
        ; Post traytip message saying keys are enabled
        ; TrayTip,,Alt keys enabled, 1

        ; If 64 bit path is present, change icon to green H
        IfExist, % x64Path
            Menu, Tray, Icon, % x64Path, 4
        ; If 32 bit path is present, change icon to green H
        IfExist, % x86Path
            Menu, Tray, Icon, % x86Path, 4
    }Else{
        ; Post traytip message saying keys are disabled
        ; TrayTip,,Alt keys disabled, 1

        ; If 64 bit path is present, change icon to red H
        IfExist, % x64Path
            Menu, Tray, Icon, % x64Path, 1
        ; If 32 bit path is present, change icon to red H
        IfExist, % x86Path
            Menu, Tray, Icon, % x86Path, 1
    }
return

; If toggle is set to 1, activate hotkeys
#If (toggle = 1)
*j::Left
*i::Up
*l::Right
*k::Down
*h::BackSpace
*'::Delete
*n::Home
*m::End
*u::PGUP
*o::PGDN
*^!SPACE::Send, {ESCAPE DOWN}{ESCAPE UP}

; For Excel
*^s::Send, {Ctrl Down}-{Ctrl Up}

#If

; ==================== Auto-Exec Section ====================

#SingleInstance, Force

; ========== Var declaration ==========

; Force Learn Mode disabled by default
forceLearnToggle:=	0

; Key's to disable when Force Learn Mode is active.
disableKeyArray	:=	["Numpad0"
					,"Numpad1"
					,"Numpad2"
					,"Numpad3"
					,"Numpad4"
					,"Numpad5"
					,"Numpad6"
					,"Numpad7"
					,"Numpad8"
					,"Numpad9"
					,"NumpadDot"
					,"NumpadIns"
					,"NumpadHome"
					,"NumpadEnd"
					,"NumpadDown"
					,"NumpadUp"
					,"NumpadRight"
					,"NumpadLeft"
					,"NumpadClear"
					,"NumpadPgUp"
					,"NumpadPgDn"
					,"NumpadDel"
					,"NumpadDiv"
					,"NumpadMult"
					,"NumpadAdd"
					,"NumpadSub"
					,"NumpadEnter"
					,"Right"
					,"Left"
					,"Up"
					,"Down"
					,"End"
					,"Home"
					,"PGDN"
					,"PGUP"
					,"Delete"
					,"Insert"]

; Generate Force Learn Mode hotkeys.
for index, value in disableKeyArray
	Hotkey, % "*" value, Null, Off

Null:
return

; ==================== End Auto-Exec Section ====================

; Turn Force Learn Mode on/off
+F1::GoSub, ForceLearn

ForceLearn:
	forceLearnToggle	:= !forceLearnToggle
	TrayTip, Force Learn Mode, % (forceLearnToggle = 1 ? "On" : "Off"), 1.5
	for index, value in disableKeyArray
		if (forceLearnToggle = 1)
			Hotkey, % "*" Value, On
		Else
			Hotkey, % "*" Value, Off
return

; If Alt is being held, enable hotkeys
#If GetKeyState("Alt", "P")
!o::Send, {Numpad9}
!i::Send, {Numpad8}
!u::Send, {Numpad7}
!l::Send, {Numpad6}
!k::Send, {Numpad5}
!j::Send, {Numpad4}
!.::Send, {Numpad3}
!,::Send, {Numpad2}
!m::Send, {Numpad1}
!/::Send, {NumpadDot}
!h::Send, {Backspace}
!'::Send, {Delete}
!SC027::Send, {=}
!Space::Send, {Numpad0}
!^Space::Send, {Esc}

#If GetKeyState("Ctrl", "P")
!^h::Send, {Ctrl Down}{Backspace}{Ctrl Up}
!^'::Send, {Ctrl Down}{Right}{Backspace}{Ctrl Up}

;For Chrome Shorcuts
!^j::Send, {Ctrl Down}{PgUp}{Ctrl Up}
!^l::Send, {Ctrl Down}{PgDn}{Ctrl Up}
!^n::Send, {Ctrl Down}1{Ctrl Up} 
!^m::Send, {Ctrl Down}9{Ctrl Up}
!^w::Send, {Ctrl Down}w{Ctrl Up}
!^z::Send, {Ctrl Down}{Shift Down}T{Shift Up}{Ctrl Up}

; In addition to Alt being held, if Shift is also being held, enable hotkeys
#If GetKeyState("Shift", "P")

!+h::Send, {Backspace}
!+'::Send, {Delete}
!+m::Send, {!}     ;1
!+,::Send, {@}     ;2
!+.::Send, {#}     ;3
!+j::Send, {$}     ;4
!+k::Send, {`%}    ;5
!+l::Send, {^}     ;6
!+u::Send, {&}     ;7
!+i::Send, {*}     ;8
!+o::Send, {(}     ;9
!+SPACE::Send, {)} ;0
!+a::Send, {+}
!+s::Send, {-}
!+x::Send, {*}
!+c::Send, {/}
;!^+h::Send, {Ctrl Down}{Backspace}{Ctrl Up}
;!^+'::Send, {Ctrl Down}{Delete}{Ctrl Up}

#If