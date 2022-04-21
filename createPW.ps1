$password_file_location = "C:\sleepless\credentials.txt"
###location and filename can be anything you want it to be

Read-Host "Enter New Password" -AsSecureString |  ConvertFrom-SecureString | Out-File $password_file_location