' =====================================================================================================================
' This visual basic script starts FullBatteryNotification after Windows boots up.
' All you have to do is to move this file into Startup directory located in:
' C:\Users\<your_user>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\
' Then change content of the "path" variable to absolute path to the PowerShell script.
' After reboot, FullBatteryNotification script will inform you when your battery is full.
'
' See: 
' https://stackoverflow.com/questions/16303150/how-can-i-run-a-powershell-script-as-a-background-task-without-displaying-a-wind
' =====================================================================================================================

Dim path 
path = "C:\Users\janma\AppData\Roaming\FullBatteryNotification\"

' =====================================================================================================================
' DO NOT EDIT ANYTHING BELOW THIS COMMENT ;)
' =====================================================================================================================

Set objShell = CreateObject("WScript.Shell")
objShell.Run "CMD /C START /B " & objShell.ExpandEnvironmentStrings("%SystemRoot%") & "\System32\WindowsPowerShell\v1.0\powershell.exe -file " & path & "FullBatteryNotification.ps1", 0, False
Set objShell = Nothing