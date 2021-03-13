Clear-Host
$ErrorActionPreference= 'silentlycontinue'
$BackgroundColor = "Red"
$ForegroundColor = "Black"
Write-Host -BackgroundColor $BackgroundColor -ForegroundColor $ForegroundColor "#####################################################################"
Write-Host -BackgroundColor $BackgroundColor -ForegroundColor $ForegroundColor "####################Importing Cyber Defense Tools####################"
Write-Host -BackgroundColor $BackgroundColor -ForegroundColor $ForegroundColor "#####################################################################"
Set-Location -Path "C:\code\4D5A\Cybersecurity\Incident Response\Azure Active Directory"
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
Import-Module -Name ExchangeOnlineManagment -ErrorAction:SilentlyContinue -UseWindowsPowerShell
Clear-Host
Write-Host -BackgroundColor $BackgroundColor -ForegroundColor $ForegroundColor "This PowerShell tool is used to collect Exchange Online logs from a mailbox which you believe has been compromised."
$ExchangeOnlineManagementUPN  = Read-Host "Enter the UserPrincipalName for Exchange Online"
Connect-ExchangeOnline -UserPrincipalName $ExchangeOnlineManagementUPN -ShowProgress $true
$UPN = Read-Host "Enter the User Principal Name of the account which is suspected of being compromised"
./Get-InboxRules.ps1
./Get-ExchangeOnlineLogs.ps1
$s = Get-PSSession
Remove-PSSession $s -Confirm:$false
Disconnect-ExchangeOnline -Confirm:$false