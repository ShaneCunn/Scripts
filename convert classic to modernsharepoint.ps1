############################Description#######################################################
#The below script will convert the classic SharePoint page to modern SharePoint page using PnP
##############################################################################################

CLS
$userName = "admin@occo.onmicrosoft.com"
$passWord = "EYs4xP8rafqf348JQgXq"
$encPassWord = convertto-securestring -String $passWord -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $userName, $encPassWord

#Connect-PnPOnline -Url "https://globalsharepoint2019.sharepoint.com/sites/SharePointRNDClassic" -Credentials $cred
Connect-PnPOnline -Url https://sleeplessservers.sharepoint.com -UseWebLogin
 
#Using the below command converting the classic "home.aspx" page to modern page and adds the page accept banner web part on top of the page.  
ConvertTo-PnPClientSidePage -Identity home.aspx -AddPageAcceptBanner  