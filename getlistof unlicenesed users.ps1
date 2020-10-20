 Install-Module -Name AzureAD

$credential = Get-Credential

Connect-AzureAD -Credential $credential

#Get-AzureAdUser | ForEach{ $licensed=$False ; For ($i=0; $i -le ($_.AssignedLicenses | Measure).Count ; $i++) { If( [string]::IsNullOrEmpty(  $_.AssignedLicenses[$i].SkuId ) -ne $True) { $licensed=$true } } ; If( $licensed -eq $false) { Write-Host $_.UserPrincipalName} }

Get-MsolUser -UnlicensedUsersOnly | export-csv c:\reports\Unlicensed_Users.CSV