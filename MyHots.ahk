#Include %A_ScriptDir%
#Include Spotify.ahk
global VolumePercentage
global ShuffleMode
global RepeatMode := 0
spoofy := new Spotify
VolumePercentage := spoofy.Player.GetCurrentPlaybackInfo().Device.Volume
return


^<+Insert::
spoofy.Player.SaveCurrentlyPlaying() ;
return

^<+Delete::
spoofy.Player.UnSaveCurrentlyPlaying() ;
return

#IfWinActive ahk_class CabinetWClass ; for use in explorer.
^<+c::
ClipSaved := ClipboardAll
Send !d
Sleep 10
Send ^c
Run, cmd /K "cd `"%clipboard%`""
Clipboard := ClipSaved
ClipSaved =
return
#IfWinActive
