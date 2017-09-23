#######################################################################################################################
## BATTERY NOTIFICATION POWERSHELL SCRIPT
#######################################################################################################################
##
## Version: 1.0
## Author: Jan Malčák
## Date: 11th September 2017
##
## This powershell script keeps polling battery status in an infinite loop. If the battery is charging even though
## it is fully charged, a notification with sound is created.
##
## It is the first working version and my first PowerShell script at the same time. It is expected to have some bugs
## and design flaws. Please feel free to contact me with any enhacement idea or bug you find. Thank you.
##
## Requirements:
## -------------
##
## Powershell >= 5.0 (Tested version)
## 
## Configuration:
## --------------
##
## Configuration file named "config.psd1" is expected to be placed in the current directory. It has to contain 
## following keys:
##
## - Icon           Relative path to the icon of Full battery shown in system tray when notification is invoked.
##                  It should be .ico file with resolution of 16x16 pixels.
## - Title          Notification title
## - Text           Localized notification text
## - BatteryLevel   Number from 0 to 100 representing battery level in percentage which should be used as 
##                  indicator that the battery is full.
## - ShowDuration   Number of milliseconds for which the notification is shown.
## - UpdateInterval Number of seconds between each battery check
##
## Useful links:
## -------------
##
## Win32_Battery Documentation: 
##      https://msdn.microsoft.com/en-us/library/aa394074%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
##
## Building a Battery Manager with PowerShell
##      https://www.petri.com/building-battery-manager-powershell
##
## How to read powershell psd1 files safely
##      https://stackoverflow.com/questions/25408815/how-to-read-powershell-psd1-files-safely
##
## PowerShell Configuration Data
##      http://ramblingcookiemonster.github.io/PowerShell-Configuration-Data/
##
## Windows PowerShell Tip of the Week
##      https://technet.microsoft.com/en-us/library/ff730952.aspx
## 
#######################################################################################################################

######### USE

# Load forms class, void in the beginning of the line ignores whatever output of LoadWithPartialName function call
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

######### CONFIGURATION

# Load configuration file and save it to $Config variable
Import-LocalizedData -FileName "Config.psd1" -BindingVariable Config

######### NOTIFICATION

# Get path to the FullBattery icon shown in the tray
$path = Resolve-Path $Config.Icon
# Create new NotifyIcon object, which handles a notification
$notification = New-Object System.Windows.Forms.NotifyIcon 
# Load icon from file
$icon = New-Object System.Drawing.Icon( $path )
# Path to the icon shown on main panel. It is required to be 16 x 16px
$notification.Icon = $icon
# Icon shown next to the notification text. One of "Error", "Info", "None", "Warning"
$notification.BalloonTipIcon = "Info"
# Content of the notification 
$notification.BalloonTipText = $Config.Text
$notification.BalloonTipTitle = $Config.Title

######### LOOP

$run = $True
While ( $run ) {

    # Get battery information
    $battery_data = Get-WmiObject Win32_Battery

    # Status == 2 means charging
    # Status == 1 means running from battery
    $status = $battery_data.BatteryStatus

    # Battery life as percentage
    $percentage = $battery_data.EstimatedChargeRemaining
    
    # Available == 2 means charging
    # Available == 3 means running from battery
    $available = $battery_data.Availability

    ## Check conditions for showing the notification
    if ( $status -eq 2 -And $percentage -ge $Config.BatteryLevel -And $available -eq 2) {

        # Show notification for 10 seconds
        $notification.Visible = $True 
        $notification.ShowBalloonTip( $Config.ShowDuration )
        $notification.Visible = $False

    }
    
    Start-Sleep -Seconds $Config.UpdateInterval
}