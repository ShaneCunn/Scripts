#Requires -RunAsAdministrator
#Set-ExecutionPolicy RemoteSigned
## Variables

$fileExists = Test-Path -Path C:\Sleepless\uninstallcrap.ps1 
$folderExists = Test-Path -Path C:\Sleepless

$Username = "itservice"
$Password = "password123!"
$group = "Administrators"

$adsi = [ADSI]"WinNT://$env:COMPUTERNAME"
$existing = $adsi.Children | where {$_.SchemaClassName -eq 'user' -and $_.Name -eq $Username }

$pass = Read-Host 'What is your password?' -AsSecureString

#Write-Host "Starting script"


if(!$folderExists){
New-Item -ItemType directory -Path C:\Sleepless
}
else{
#Write-Host "Folder exists"
}


Set-Location -Path C:\Sleepless



#callCleanBloatware
#Get-Location


function callCleanBloatware(){
Write-Host "Starting Bloatware script" 

cleanmachine

Write-Host "Finished bloatware script"
}

#callSetupLocalAdmin

function callSetupLocalAdmin(){
Write-host "Calling local admin script"  -ForegroundColor Green


if ($existing -eq $null) {

   Write-Host "Creating new local user $Username."
    & NET USER $Username $pass /add /y /expires:never
    
   Write-Host "Adding local user $Username to $group."
    & NET LOCALGROUP $group $Username /add

}
else {
   Write-Host "Setting password for existing local user $Username."
    $existing.SetPassword($pass)
}

Write-Host "Ensuring password for $Username never expires."
& WMIC USERACCOUNT WHERE "Name='$Username'" SET PasswordExpires=FALSE
}

#Netplwiz.exe

#installOffice365

function installOffice365(){
Write-host "Starting installer for Office 365"  -ForegroundColor Red -BackgroundColor Yellow

Start-Process C:\Sleepless\OfficeSetup.exe -Wait

}

installApps
function installApps(){

#Start-Process C:\Sleepless\basicInstaller.exe

Write-Host "test"


$Prompt = Read-host "Should I display the file contents c:\test for you? (Y | N)" 
Switch ($Prompt)
     {
       Y {Get-ChildItem C:\Sleepless}
       N {Write-Host "User canceled the request"}
       Default {installApps}
     }

}

y
y
function cleanmachine(){
<#
  This is a helpful script that will remove the default Windows 10 garbage from your computer
  
  * Comment out any apps that you might want to keep
  * Don't forget to run as admin
#>
#Get-ExecutionPolicy;
#Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass -Force;


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

}