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
If (-Not (Get-Module -Name AzureAD)) {
    ./New-AzureADModule.ps1
}
./Disable-AzureADUser.ps1