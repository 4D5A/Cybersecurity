Set-Location -Path "C:\code\4D5A\Cybersecurity\Incident Response\Azure Active Directory"
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
Import-Module -Name AzureAD -ErrorAction:SilentlyContinue -UseWindowsPowerShell
If (-Not (Get-Module -Name AzureAD)) {
    ./New-Modules.ps1
}
./Disable-AzureADUser.ps1