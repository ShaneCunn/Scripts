#Set-ExecutionPolicy RemoteSigned
$fileExists = Test-Path -Path C:\Sleepless\uninstallcrap.ps1 
$folderExists = Test-Path -Path C:\Sleepless

Write-Host "Starting script"


if(!$folderExists){
New-Item -ItemType directory -Path C:\Sleepless

}
else{
Write-Host "Folder exists"
}


Set-Location -Path C:\Sleepless

if (!$fileExists){
Write-Host "Files copied"
Copy-Item 'C:\Users\ShaneCunningham\Documents\GitHub\Scripts\uninstallcrap.ps1' 'C:\Sleepless\uninstallcrap.ps1'
}
else{
Write-Host "Files exists"

}


#Copy-Item 'C:\Users\ShaneCunningham\Documents\GitHub\Scripts\uninstallcrap.ps1' 'C:\Sleepless\uninstallcrap.ps1'
Get-Location
callCleanBloatware

function callCleanBloatware(){
Write-Host "Starting Bloatware script" 

& '.\uninstallcrap.ps1'
#Get-ChildItem

Write-Host "Finished bloatware script"
}

callSetupLocalAdmin

function callSetupLocalAdmin(){
Write-host "Calling local admin script" 

}
