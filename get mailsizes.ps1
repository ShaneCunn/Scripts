$cred = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $cred -Authentication Basic -AllowRedirection

Import-PSSession $Session


Get-Mailbox -ResultSize Unlimited | Get-MailboxFolderStatistics -IncludeAnalysis -FolderScope All | Where-Object {(($_.TopSubjectSize -Match "MB") -and ($_.TopSubjectSize -GE 50.0)) -or ($_.TopSubjectSize -Match "GB")} | Select-Object Identity, TopSubject, TopSubjectSize | Export-CSV -path "E:\reports\report.csv" -notype



Get-Mailbox -RecipientTypeDetails UserMailBox -ResultSize Unlimited |
Get-MailboxStatistics |
Where-Object {!$_.DisconnectDate} |
Sort-Object -Property TotalItemSize -Descending |
Select-Object DisplayName,ItemCount,{$_.TotalItemSize.Value.ToMB()},LastLogonTime  | Export-CSV -path "E:\reports\report2.csv" -notype


 
 Get-Mailbox | Get-MailboxStatistics | Select-Object DisplayName, @{name=”TotalItemSize (GB)”;expression={[math]::Round((($_.TotalItemSize.Value.ToString()).Split(“(“)[1].Split(” “)[0].Replace(“,”,””)/1GB),2)}},ItemCount | Sort “TotalItemSize (GB)” -Descending | Export-CSV "E:\reports\report2.csv"