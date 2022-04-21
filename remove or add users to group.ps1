 #Get-DistributionGroup | Export-csv -Path "C:\sleepless\groups.csv" -NoTypeInformation
Install-Module PowerShellGet -Force	
Install-Module –Name ExchangeOnlineManagement
Connect-EXOPSSession -UserPrincipalName shane@sleepless.ie


$Distribution_Groups = import-csv "C:\sleepless\groupsnew.csv"
  

$NewOwner = "shane@sleepless.ie"

    foreach ($Group in $Distribution_Groups){
    Write-Host $Group.Groupname
        Set-DistributionGroup -Identity $Group.groupname -ManagedBy @{remove=$NewOwner} 
       ## Set-DistributionGroup -Identity $Group.groupname -ManagedBy @{add=$NewOwner} 
       ## line will the email to distribution group
     }