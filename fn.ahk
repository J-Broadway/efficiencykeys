﻿; Only allow one instance of the script to be ran at a time.
#SingleInstance, Force

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode,2
flag:=0
isSuspend:=False
Path := "C:\Program Files (x86)\AutoHotkey\AutoHotkey.exe"

IfExist, % Path
	Menu, Tray, Icon, % Path, 1
Else
	{
		Path:= "C:\Program Files\AutoHotkey\AutoHotkey.exe"
		Menu, Tray, Icon, % Path, 1
	}

^;::
if(flag=0)
{
	flag:=1
	Menu, Tray, Icon, % Path, 4
	SetTimer, ShowTooltip, 100
}
else
{
	Menu, Tray, Icon, % Path, 1
	flag:=0
	SetTimer, ShowTooltip, Off
	Tooltip ; Hide the tooltip
}
return

ShowTooltip:
if (flag = 1)
{
	MouseGetPos, x, y
	Tooltip, fn, x+10, y+10
}
return

^+d::
Suspend ; very first line
isSuspend := !isSuspend
return

; Global Shortcuts
*^!SPACE::Send, {ESCAPE DOWN}{ESCAPE UP}

#If GetKeyState("Shift", "P") && GetKeyState("Alt", "P")
	f & m::Send,!{f1}
	f & ,::Send,!{f2}
	f & .::Send,!{f3}
	f & j::Send,!{f4}
	f & k::Send,!{f5}
	f & l::Send,!{f6}
	f & u::Send,!{f7}
	f & i::Send,!{f8}
	f & o::Send,!{f9}
	f & space::Send,!{f10}

#If GetKeyState("Alt", "P")
	!m::Send, {Numpad1}
	!,::Send, {Numpad2}
	!.::Send, {Numpad3}
	!j::Send, {Numpad4}
	!k::Send, {Numpad5}
	!l::Send, {Numpad6}
	!u::Send, {Numpad7}
	!i::Send, {Numpad8}
	!o::Send, {Numpad9}
	!/::Send, {NumpadDot}
	!h::Send, {Backspace}
	!'::Send, {Delete}
	!SC027::Send, {=}
	!Space::Send, {Numpad0}
	!^Space::Send, {Esc}
	!^h::Send, {CTRL DOWN}{BACKSPACE}{CTRL UP}
	!^'::Send, {CTRL DOWN}{RIGHT}{BACKSPACE}{CTRL UP}

	!+m::Send, {!}
	!+,::Send, {@}
	!+.::Send, {#}
	!+j::Send, {$}
	!+k::Send, {asc 0037}
	!+l::Send, {^}
	!+u::Send, {&}
	!+i::Send, {*}
	!+o::Send, {(}
	!+Space::Send, {)}

#If GetKeyState("Alt", "P")
	f & m::Send,{f1}
	f & ,::Send,{f2}
	f & .::Send,{f3}
	f & j::Send,{f4}
	f & k::Send,{f5}
	f & l::Send,{f6}
	f & u::Send,{f7}
	f & i::Send,{f8}
	f & o::Send,{f9}
	f & space::Send,{f10}

#If WinActive("ahk_exe chrome.exe") || WinActive("ahk_exe brave.exe") || WinACtive("ahk_exe Exocharts-Pro.exe")
; For Chrome and Brave Shorcuts
	!^j::Send, {Ctrl Down}{PgUp}{Ctrl Up}
	!^l::Send, {Ctrl Down}{PgDn}{Ctrl Up}
	!^n::Send, {Ctrl Down}1{Ctrl Up}
	!^m::Send, {Ctrl Down}9{Ctrl Up}
	!^w::Send, {Ctrl Down}w{Ctrl Up}
	!^z::Send, {Ctrl Down}{Shift Down}T{Shift Up}{Ctrl Up}

; CTRL + SHIFT + PG_UP/PG_DOWN will trigger CTRL + HOME/END
	^+PgUp::
	Send, ^{Home}
	return

	^+PgDn::
	Send, ^{End}
	return

#If flag=1
	*j::Left
	*i::Up
	*l::Right
	*k::Down
	*h::BackSpace
	*'::Delete
	*n::Home
	*m::End
	*u::PgUp
	*o::PgDn
	*+SPACE::Send, {End}{SHIFT DOWN}{Home}{SHIFT UP}