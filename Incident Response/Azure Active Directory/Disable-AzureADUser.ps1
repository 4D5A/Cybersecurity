$Logfilepath = "C:\Powershell Log Files\Disable-AzureADUser-$(Get-Date -f ddMMMyyyy).log"
Start-Transcript -Path $Logfilepath
Write-Host "Installing required Powershell Modules..."
./New-Modules.ps1
Write-Host "Importing required Powershell Modules..."
./Import-Modules.ps1
$AzureADManagementUPN = Read-Host "Enter the Azure Active Directory Management UserPrincipalName"
Connect-AzureAD -AccountID $AzureADManagementUPN
Clear-Host
$UPN = Read-Host "Enter the User Principal Name of the account which is suspected of being compromised."
  $DisableAzureADUserDisableConfirm = Read-host "If you continue, the AzureAD user $UPN will be disabled and active AzureAD tokens used for authentication by $UPN will be revoked. Do you want to proceed? (Yes/No)"
    If ($DisableAzureADUserDisableConfirm -like "Yes") {
      Get-AzureADUser -ObjectID $UPN | Set-AzureADUser -AccountEnabled $false
      Get-AzureADUser -ObjectID $UPN | Revoke-AzureADUserAllRefreshToken
      Get-AzureADUser -ObjectID $UPN | Select-Object UserPrincipalName, AccountEnabled
    }
    If ($DisableAzureADUserDisableConfirm -notlike "Yes") {
      Write-Host "You decided not to disable the AzureAD user $UPN and revoke all AzureAD tokens for AzureAD user $UPN. You also indicated you believe the AzureAD account $UPN is compromised. If you meant to disable the AzureAD account $UPN and revoke all AzureAD tokens for the AzureAD account $UPN, please run the script again and answer the questions correctly."
    }
Disconnect-AzureAD
Stop-Transcript