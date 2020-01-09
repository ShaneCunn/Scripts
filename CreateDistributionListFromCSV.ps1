$lists = import-csv “C:\Users\ShaneCunningham\Documents\scripts\disGroup.csv”
foreach ($list in $lists ){
$name = ($list."Name".Trim())
$displayName = ($list."DisplayName".Trim())
$alias = ($list."Alias".Trim())
$alias = $alias.replace(' ','')

$externalEmail = ($list."PrimarySMTPAddress".Trim()) + "@finegael.ie"
$externalEmail = $externalEmail.replace(' ','')
Write-host $name + "Email " + $displayName + " " + $alias
Write-Host $externalEmail

#New-MailContact -ExternalEmailAddress  $externalEmail -Name $externalEmail

New-DistributionGroup -Name $name -DisplayName $displayname –Alias $alias -PrimarySmtpAddress $externalEmail

}



#
#Import-Csv "C:\Users\v-9soaway\Desktop\groups.csv" | foreach {New-DistributionGroup -Name $_.name -DisplayName $_.displayname –Alias 
#$_.alias -PrimarySmtpAddress $_.PrimarySmtpAddress -RequireSenderAuthenticationEnabled ([boolean] $_.RequireSenderAuthenticationEnabled)}