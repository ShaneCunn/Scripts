#Set-ExecutionPolicy RemoteSigned
## Variables

$fileExists = Test-Path -Path C:\Sleepless\uninstallcrap.ps1 
$folderExists = Test-Path -Path C:\Sleepless

$Username = "testuser"
$Password = "password123!"
$group = "Administrators"

$adsi = [ADSI]"WinNT://$env:COMPUTERNAME"
$existing = $adsi.Children | where {$_.SchemaClassName -eq 'user' -and $_.Name -eq $Username }

#$pass = Read-Host 'What is your password?' -AsSecureString

#Write-Host "Starting script"


if(!$folderExists){
New-Item -ItemType directory -Path C:\Sleepless
}
else{
#Write-Host "Folder exists"
}


Set-Location -Path C:\Sleepless

if (!$fileExists){
#Write-Host "Files copied"
Copy-Item 'C:\Users\ShaneCunningham\Documents\GitHub\Scripts\uninstallcrap.ps1' 'C:\Sleepless\uninstallcrap.ps1'
}
else{
#Write-Host "Files exists"
callCleanBloatware
}


Get-Location


function callCleanBloatware(){
#Write-Host "Starting Bloatware script" 

& '.\uninstallcrap.ps1'
#Get-ChildItem

#Write-Host "Finished bloatware script"
}

callSetupLocalAdmin

function callSetupLocalAdmin(){
Write-host "Calling local admin script"  -ForegroundColor Green


if ($existing -eq $null) {

   # Write-Host "Creating new local user $Username."
    & NET USER $Username $Password /add /y /expires:never
    
   # Write-Host "Adding local user $Username to $group."
    & NET LOCALGROUP $group $Username /add

}
else {
   # Write-Host "Setting password for existing local user $Username."
    $existing.SetPassword($Password)
}

#Write-Host "Ensuring password for $Username never expires."
& WMIC USERACCOUNT WHERE "Name='$Username'" SET PasswordExpires=FALSE
}

Netplwiz.exe

installOffice365

function installOffice365(){
#Write-host "Starting installer for Office 365"  -ForegroundColor Red -BackgroundColor Yellow

Start-Process C:\Sleepless\OfficeSetup.exe -ArgumentList -Wait

}