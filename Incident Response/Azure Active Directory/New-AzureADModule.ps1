#Requires -RunAsAdministrator
Write-Host "Installing required Powershell Modules..."
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
Install-Module -Name AzureAD -Force
Import-Module -Name AzureAD
./Disable-AzureADUser.ps1