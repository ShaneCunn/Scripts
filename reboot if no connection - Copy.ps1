#if (!(Test-Connection 8.8.8.8 -quiet)) 
if ((Test-Connection 8.8.8.8 -quiet)) 
{Write-Host "test connected"}
#{Restart-Computer -Force}