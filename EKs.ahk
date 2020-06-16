; Only allow one instance of the script to be ran at a time.
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
}
else
{
	Menu, Tray, Icon, % Path, 1
	flag:=0
}
return

^+d::
Suspend ;  very first line
IsSuspend := !IsSuspend
Return

;Global Shortcuts
*^!SPACE::Send, {ESCAPE DOWN}{ESCAPE UP}


#If GetKeyState("Alt", "P")
	!i::Send, {Numpad8}
	!o::Send, {Numpad9}
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
	!^h::Send, {CTRL DOWN}{BACKSPACE}{CTRL UP}
	!^'::Send, {CTRL DOWN}{RIGHT}{BACKSPACE}{CTRL UP}

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


#If WinActive("Google Chrome")
	;For Chrome Shorcuts
	!^j::Send, {Ctrl Down}{PgUp}{Ctrl Up}
	!^l::Send, {Ctrl Down}{PgDn}{Ctrl Up}
	!^n::Send, {Ctrl Down}1{Ctrl Up} 
	!^m::Send, {Ctrl Down}9{Ctrl Up}
	!^w::Send, {Ctrl Dopwn}w{Ctrl Up}
	!^z::Send, {Ctrl Down}{Shift Down}T{Shift Up}{Ctrl Up}
																	 
#If flag=1
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
	*+SPACE::Send, {End}{SHIFT DOWN}{Home}{SHIFT UP}