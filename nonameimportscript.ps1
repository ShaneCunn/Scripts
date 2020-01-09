
$contacts = import-csv “C:\Users\ShaneCunningham\Documents\scripts\smallwithnonames.csv”
foreach ($contact in $contacts ){
#$fn = ($contact."First Name".Trim())
#$ln = ($contact."Last Name".Trim())
#$mn = ($contact."Middle Name".Trim())
$externalEmail = ($contact."E-mail Address".Trim())
$fullname = $fn + "." + $mn + "." + $ln
#Write-host $fullname + "Email " + $externalEmail
#Write-Host $externalEmail

New-MailContact -ExternalEmailAddress  $externalEmail -Name $externalEmail


}

#$fn = $_."First Name" $ln = $_."Last Name" $full = $fn + " " + $ln