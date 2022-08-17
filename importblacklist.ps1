##Import-Module ExchangeOnlineManagement
##Connect-ExchangeOnline
##foreach ($content in (get-content “D:\blacklist_addresses.csv”)){$temp=(get-transportrule “Blacklist”).From;$temp+=$content;set-transportrule “Blacklist” -From $temp}


##Get-Mailbox -ResultSize unlimited

##Get-HostedContentFilterPolicy "test blocklist"


 
$emails =  "C:\Users\ShaneCunninghamSleep\Sleepless Server Solutions Ltd\Projects - Documents\Chanelle - Public Folders Migration\Chanelle1.csv" # EDIT THIS
 
$count = 1
foreach ($content in ($total = get-content $emails)){
    $totalcount = $total.count
    Set-HostedContentFilterPolicy -Identity "test blocklist" –BlockedSenders @{add=$content}
    write-host "Added $count entries of $totalcount : $content"
    $count += 1
}

