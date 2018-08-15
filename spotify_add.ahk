#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; end the script
#z::
    quit = 1
return

; start the script
#space::
    MsgBox Starting the script
    
    ; while the end hotkey hasn't been pressed
    quit = 0
    while (quit = 0) {
    
        ; get the color at current mouse coords
        x_pos = 0
        y_pos = 0
        MouseGetPos, x_pos, y_pos
        color_at_mouse = 0
        PixelGetColor, color_at_mouse, x_pos, y_pos
        
        ; click until the heart icon turns white
        while (color_at_mouse != 0xFFFFFF && quit = 0) {
            ;Sleep 200
            Click
            sleep 200
            MouseGetPos, x_pos, y_pos
            PixelGetColor, color_at_mouse, x_pos, y_pos
            ; MsgBox , , , %color_at_mouse%, 1
        }
        
        ; hit the up arrow until the heart icon is no longer white
        while (color_at_mouse == 0xFFFFFF && quit = 0) {
            ;Sleep 200
            SendInput {Up}
            sleep 200
            MouseGetPos, x_pos, y_pos
            PixelGetColor, color_at_mouse, x_pos, y_pos
            ; MsgBox , , , %color_at_mouse%, 1
        }

    }
return
    
    

