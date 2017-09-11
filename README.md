# Full Battery Notification

This powershell script keeps polling battery status in an infinite loop. If the battery is charging even though
it is fully charged, a notification with sound is created.

It allows user to define custom icon, text and duration for shown notification.

## Configuration

Configuration is loaded from file config.psd1 in current working directory. It has to consist of following keys:

- __Icon__ - Relative path to the icon of Full battery shown in system tray when notification is invoked. It should be .ico file with resolution of 16x16 pixels.
- __Title__ - Notification title
- __Text__ - Localized notification text
- __BatteryLevel__ - Number from 0 to 100 representing battery level in percentage which should be used as indicator that the battery is full.
- __ShowDuration__ - Number of milliseconds for which the notification is shown.
- __UpdateInterval__ - Number of seconds between each battery check

Default configuration:
```powershell
@{
    Icon = ".\FullBattery.ico"
    Title = "Battery is full"
    Text = "Your battery is full. Please unplug the charger."
    BatteryLevel = 89
    ShowDuration = 5000
    UpdateInterval = 30
}
```

## How does it look?
![Image of the notification](https://raw.githubusercontent.com/malja/full_battery_notification/master/ScreenShot.png)

## Icon
Icon made by [Freepik](http://www.freepik.com) from [Flaticon](https://www.flaticon.com/") is licensed by [CC 3.0](http://creativecommons.org/licenses/by/3.0/).
