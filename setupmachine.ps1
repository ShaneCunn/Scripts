Set-ExecutionPolicy RemoteSigned

Write-Host "Starting script"
New-Item -ItemType directory -Path C:\Sleepless
Set-Location -Path C:\Sleepless
Copy-Item 'C:\Users\ShaneCunningham\Documents\GitHub\Scripts\uninstallcrap.ps1' 'C:\Sleepless\uninstallcrap.ps1'
Get-Location
callCleanBloatware

function callCleanBloatware(){
Write-Host "Starting Bloatware script" 

& '.\uninstallcrap.ps1'
#Get-ChildItem

}