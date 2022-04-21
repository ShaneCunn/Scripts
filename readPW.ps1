$password_file_location = "C:\sleepless\credentials.txt"

$password = Get-Content $password_file_location | ConvertTo-SecureString

Write-Host "the password is: " $password  | ConvertFrom-SecureString