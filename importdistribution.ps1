#$UserCredential = Get-Credential

#$O365Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

#Import-PSSession $O365Session


$contactList = import-csv “C:\Users\ShaneCunningham\Desktop\Email lists\Farming.csv”

foreach ($contact in $contactList){
#$fn = ($contact."First Name".Trim())
#$ln = ($contact."Last Name".Trim())
#$mn = ($contact."Middle Name".Trim())
$externalEmail = ($contact."E-mail Address".Trim())
$fullname = $fn + "." + $mn + "." + $ln
#Write-host $fullname + "Email " + $externalEmail
#Write-Host $externalEmail

Add-DistributionGroupMember -Identity "test" -Member $externalEmail


}



#$fn = $_."First Name" $ln = $_."Last Name" $full = $fn + " " + $ln

 #import-CSV "C:\Users\ShaneCunningham\Documents\scripts\test.csv" | Foreach-Object { Add-DistributionGroupMember -Identity "test" -Member $_.Member } -WhatIf