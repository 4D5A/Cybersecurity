$Logfilepath = "C:\Powershell Log Files\Get-InboxRules$(Get-Date -f ddMMMyyyy).log"
Start-Transcript -Path $Logfilepath
Get-InboxRule -Mailbox $UPN
Stop-Transcript