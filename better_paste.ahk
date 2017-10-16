; AUTOHOTKEY DEFAULTS
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Shift+Ctrl+v = Paste as plain text
+^v::
original = %ClipBoardAll%
Clipboard = %Clipboard%
Send ^v
Sleep, 100
Clipboard = %original%
original := ""
Return

; Shift+Ctrl+WinKey+v = Paste as plain text in quotes
+^#v::
original = %ClipBoardAll%
Clipboard = %Clipboard%
Send "^v"
Sleep, 100
Clipboard = %original%
original := ""
Return

; Shift+WinKey+l = Paste as lower case
+#l::
original = %ClipBoardAll%
StringLower, Clipboard, Clipboard
Send ^v
Sleep, 100
Clipboard = %original%
original := ""
Return

; Shift+WinKey+t = First letter of each word is capitalised
+#t::
original = %ClipBoardAll%
StringUpper, Clipboard, Clipboard, T
Send ^v
Sleep, 100
Clipboard = %original%
original := ""
Return


; Fixing lines on PDFs

; AltGr+v = Paste without new lines and hyphens appearing before new lines.
<^>!v::
original = %ClipBoardAll%
temp = %Clipboard%
temp := RegExReplace(temp,"([a-z])-[`r`n]+", "$1")
StringReplace,temp,temp,`r,%A_SPACE%,All
StringReplace,temp,temp,`n,%A_SPACE%,All
StringReplace, temp, temp, %A_SPACE%%A_SPACE%, %A_SPACE%, All
Clipboard = %temp%
Send ^v
Sleep, 100
Clipboard = %original%
original := ""
temp := ""
return

; AltGr+WinKey+v = Paste without new lines and hyphens appearing before new lines in quotes.
<^>!#v::
original = %ClipBoardAll%
temp = %Clipboard%
temp := RegExReplace(temp,"([a-z])-[`r`n]+", "$1")
StringReplace,temp,temp,`r,%A_SPACE%,All
StringReplace,temp,temp,`n,%A_SPACE%,All
StringReplace, temp, temp, %A_SPACE%%A_SPACE%, %A_SPACE%, All
Clipboard = %temp%
Send "^v"
Sleep, 100
Clipboard = %original%
original := ""
temp := ""
return

; Hotkeys to save time marking

<^>!t::✔

