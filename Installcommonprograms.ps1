Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

$localprograms = choco list --localonly
if ($localprograms -like "*googlechrome*")
{
    choco upgrade googlechrome
}
Else
{
    choco install googlechrome -y
}

if ($localprograms -like "*notepadplusplus*")
{
    choco upgrade notepadplusplus
}
Else
{
    choco install notepadplusplus -y
}


if ($localprograms -like "*teamviewer*")
{
    choco upgrade teamviewer
}
Else
{
    choco install teamviewer -y
}


if ($localprograms -like "*7zip*")
{
    choco upgrade 7zip
}
Else
{
    choco install 7zip -y
}


if ($localprograms -like "*zoom*")
{
    choco upgrade zoom
}
Else
{
    choco install zoom -y
}