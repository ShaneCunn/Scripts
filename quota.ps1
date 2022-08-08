$adminUPN="sysadmin@contentllama.onmicrosoft.com"
$orgName="contentllama"
$userCredential = Get-Credential -UserName $adminUPN -Message "Type the password."
Connect-SPOService -Url https://$orgName-admin.sharepoint.com -Credential $userCredential