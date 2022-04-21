$cred = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $cred -Authentication Basic -AllowRedirection

Import-PSSession $Session

$UserEmail= "bobby.rampal@capstoneconnects.com"

$Mailbox = Get-Mailbox | Where {$_.PrimarySmtpAddress -eq $UserEmail}

#$Office365GroupsMember = Get-UnifiedGroup | where { (Get-UnifiedGroupLinks $_.Alias -LinkType Members | foreach {$_.name}) -contains $mailbox.Alias}

$Office365GroupsOwner = Get-UnifiedGroup | where { (Get-UnifiedGroupLinks $_.Alias -LinkType Owners| foreach {$_.name}) -contains $mailbox.Alias}