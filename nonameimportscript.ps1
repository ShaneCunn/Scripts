
$contacts = import-csv “C:\Users\ShaneCunningham\Documents\scripts\smallwithnonames.csv”
foreach ($contact in $contacts ){

$externalEmail = ($contact."E-mail Address".Trim())
$fullname = $fn + "." + $mn + "." + $ln
#Write-host $fullname + "Email " + $externalEmail
#Write-Host $externalEmail

New-MailContact -ExternalEmailAddress  $externalEmail -Name $externalEmail


}