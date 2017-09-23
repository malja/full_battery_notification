=======================================================================================================================

This is a simple PowerShell script generating a notificatin whenever you keep charging your fully charged battery. 
Unpluging the charger at this point should improve the battery life.

Version: 1.1 (23. 09. 2017)
Github: https://github.com/malja/full_battery_notification

=======================================================================================================================

How to make it work:
--------------------

1) Move "Config.psd1" and "FullBatteryNotification.ps1" from "source" directory to whatever location you want.

2) Select one icon from "icons" directory and move it to the directory "Config.psd1" and "FullBatteryNotification.ps1" 
files are in.

3) Rename selected icon file to "FullBattery.ico".

4) Open "RunAtStartup.vbs" file in "source" directory and enter path to the "Config" and "FullBatteryNotification" 
files. (See comments there)

5) Copy "RunAtStartup.vbs" to:
C:\Users\<your_user>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

6) Restart your computer

How to set custom notification text:
------------------------------------

1) Open "Config.psd1" and edit Title and Text

How to change notification intervals:
-------------------------------------

1) Open "Config.psd1" and edit ShowDuration and UpdateInterval

ShowDuration is time in milliseconds for which the notificatin is shown.
UpdateInterval sets interval in seconds of battery level checks.

Something is not working:
-------------------------

Go to the github page and create an issue. Thank you.