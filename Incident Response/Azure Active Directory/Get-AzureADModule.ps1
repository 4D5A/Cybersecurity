Clear-Host
$BackgroundColor = "Red"
$ForegroundColor = "Black"
Write-Host -BackgroundColor $BackgroundColor -ForegroundColor $ForegroundColor "#####################################################################"
Write-Host -BackgroundColor $BackgroundColor -ForegroundColor $ForegroundColor "####################Importing Cyber Defense Tools####################"
Write-Host -BackgroundColor $BackgroundColor -ForegroundColor $ForegroundColor "#####################################################################"
Set-Location -Path "C:\code\4D5A\Cybersecurity\Incident Response\Azure Active Directory"
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
Import-Module -Name AzureAD -ErrorAction:SilentlyContinue -UseWindowsPowerShell
Clear-Host
Write-Host -BackgroundColor $BackgroundColor -ForegroundColor $ForegroundColor "This PowerShell tool is used to disable an Azure Active Directory account and revoke existing authenticated sessions with Microsoft 365 for the samee account that you believe has been compromised."
If (-Not (Get-Module -Name AzureAD)) {
    ./New-AzureADModule.ps1
}
./Disable-AzureADUser.ps1