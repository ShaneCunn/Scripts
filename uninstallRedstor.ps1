#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
#uncomment the lince above if you get a error on  “execution of scripts is disabled on this system.”

$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Redstor Pro ESE"}

$MyApp.Uninstall()
