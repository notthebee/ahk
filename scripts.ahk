; US european keyboard layout
; with Caps Lock remapped to Escape
; and additional window management shortcuts
; Both shifts switch between languages (catches Ctrl+Shift)
; github.com/notthebee



#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


Capslock::Esc

; Alt+Enter to launch terminal 
!Enter::
Process, Exist, WindowsTerminal.exe ;
if (ErrorLevel = 0) ;
{
	Run "C:\Users\notthebee\Desktop\Windows Terminal.lnk" ;
}
Else
{
	WinActivate, ahk_class CASCADIA_HOSTING_WINDOW_CLASS ;
}
Return

; Alt+w to minimize window, Alt+q to close
!w::WinMinimize, A
!q::WinClose, A

; Both shifts to switch keyboard layout
LShift & RShift::send {LShift down}{LCtrl down}{LShift up}{LCtrl up}

; Em-dash
>!-::
send, –
return

>!+-::
send, —
return

; Umlauts
>!a::
send, ä
return

>!+a::
send, Ä
return

>!o::
send, ö
return

>!+o::
send, Ö
return

>!u::
send, ü
return

>!+u::
send, Ü
return

>!s::
send, ß
return

>!5::
send, €
return

>!i::
send, î
return

>!е::
send, ё
return

>!Е::
send, Ё
return


; Grave dead key

`::
Send {U+0060}
Input, Char, L1
Send {Backspace}
if Char = a
{
    Send à
    return
}
if Char = e
{
    Send è
    return
}
if Char = i
{
    Send ì
    return
}
if Char = o
{
    Send ò
    return
}
if Char = u
{
    Send ù
    return
}
else
{
	Send {U+0060}
	return
}
Send %Char%
return

; Acute dead key

>!e::
Send {U+00B4}
Input, Char, L1
Send {Backspace}
if Char = a
{
    Send á
    return
}
if Char = e
{
    Send é
    return
}
if Char = i
{
    Send í
    return
}
if Char = o
{
    Send ó
    return
}
if Char = u
{
    Send ú
    return
}
else
{
	Send {U+00B4}
	return
}
Send %Char%
return