<#
  This is a helpful script that will remove the default Windows 10 garbage from your computer
  
  * Comment out any apps that you might want to keep
  * Don't forget to run as admin
#>
Get-ExecutionPolicy;
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass -Force;


# 3d Builder
Get-AppxPackage *3dbuilder* | Remove-AppxPackage

# Windows Alarms
Get-AppxPackage *windowsalarms* | Remove-AppxPackage

# Windows Calculator
#Get-AppxPackage *windowscalculator* | Remove-AppxPackage

# Windows Communications Apps
Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage

# Windows Camera
#Get-AppxPackage *windowscamera* | Remove-AppxPackage

# Office Hub
#Get-AppxPackage *officehub* | Remove-AppxPackage

# Skype App
Get-AppxPackage *skypeapp* | Remove-AppxPackage

# Get Started
Get-AppxPackage *getstarted* | Remove-AppxPackage

# Zune Music
Get-AppxPackage *zunemusic* | Remove-AppxPackage

# Windows Maps
Get-AppxPackage *windowsmaps* | Remove-AppxPackage

# Solitaire Collection
Get-AppxPackage *solitairecollection* | Remove-AppxPackage

# Bing Finance
Get-AppxPackage *bingfinance* | Remove-AppxPackage

# Zune Video
Get-AppxPackage *zunevideo* | Remove-AppxPackage

# Bing News
Get-AppxPackage *bingnews* | Remove-AppxPackage

# OneNote
Get-AppxPackage *onenote* | Remove-AppxPackage

# People
#Get-AppxPackage *people* | Remove-AppxPackage

# Windows Phone
Get-AppxPackage *windowsphone* | Remove-AppxPackage

# Photos
Get-AppxPackage *photos* | Remove-AppxPackage

# Windows Store
#Get-AppxPackage *windowsstore* | Remove-AppxPackage

# Bing Sports
Get-AppxPackage *bingsports* | Remove-AppxPackage

# Sound Recorder
Get-AppxPackage *soundrecorder* | Remove-AppxPackage

# Bing Weather
Get-AppxPackage *bingweather* | Remove-AppxPackage

# Xbox App
Get-AppxPackage *xboxapp* | Remove-AppxPackage

<#
# Reversal Script (Run this line to install the apps again)
Get-AppxPackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register “$($_.InstallLocation)\AppXManifest.xml”}
#>