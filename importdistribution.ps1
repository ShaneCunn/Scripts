#$UserCredential = Get-Credential

#$O365Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

#Import-PSSession $O365Session

$Listname = "Wicklow"


$dirloc = 'C:\Users\ShaneCunningham\Desktop\Email lists\'+ $Listname +'.csv'

$contactList = import-csv $dirloc

foreach ($contact in $contactList){

$externalEmail = ($contact."E-mail Address".Trim())
$fullname = $fn + "." + $mn + "." + $ln
#Write-host $fullname + "Email " + $externalEmail
#Write-Host $externalEmail

Add-DistributionGroupMember -Identity $Listname -Member $externalEmail


}