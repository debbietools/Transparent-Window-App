#SingleInstance, Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
CoordMode, Mouse, Screen


    IniRead, TransparencyLevel, settings.ini, settings, TransparencyLevel, 180
    Menu, Tray, Icon, %A_ScriptDir%\icon.ico

    Gui, Add, Text, x10 y+10 w130 Center, Make any window transparent pressing Alt+T

    Gui, Add, Text, xp+0 yp+35, Transparency level:
    Gui, Add, edit, xp+0 yp+18 w45 h20 Left, 
    Gui, Add, UpDown, xp+0 yp+0 vTransparencyLevel Range1-255 Left, %TransparencyLevel%
    Gui, Add, Button, xp+55 yp-1 gSave, Save
    Gui, Add, Text, xp-55 yp+28, 1 = invisible | 255 = visible

    Gui, Show, w150 h110, Transparent Window
Return




GuiClose:
{
ExitApp
}


Save:
{
    Gui, Submit, NoHide
    IniWrite, %TransparencyLevel%, settings.ini, settings, TransparencyLevel
    Return
}

!t::
{
 WinGetClass, Window, A
Gui, Submit, NoHide
     WinSet, Transparent, %TransparencyLevel%, ahk_class %Window%
     t++
     if (t = 2)
     {
     WinSet, Transparent, 255, ahk_class %Window%
     t = 0
        }
     Return
}