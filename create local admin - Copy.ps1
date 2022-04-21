#Requires -RunAsAdministrator
$Username = "testuser"
$Password = "password123!"
$group = "Administrators"

$adsi = [ADSI]"WinNT://$env:COMPUTERNAME"
$existing = $adsi.Children | Where-Object { $_.SchemaClassName -eq 'user' -and $_.Name -eq $Username }


    Write-host "Calling local admin script"  -ForegroundColor Green


    if ($null -eq $existing) {

        Write-Host "Creating new local user $Username."
        & NET USER $Username $Password /add /y /expires:never
    
        Write-Host "Adding local user $Username to $group."
        & NET LOCALGROUP $group $Username /add

    }
    else {
        Write-Host "Setting password for existing local user $Username."
        $existing.SetPassword($Password)
    }

    Write-Host "Ensuring password for $Username never expires."
