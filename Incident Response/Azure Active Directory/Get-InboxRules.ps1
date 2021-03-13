$Logfilepath = "C:\Powershell Log Files\Get-InboxRules$(Get-Date -f ddMMMyyyy).log"
Start-Transcript -Path $Logfilepath
Get-InboxRule -Mailbox $UPN | Select-Object description, name, ruleidentity, identity, Deletemessage, deletesystemcategory, forwardasattachmentto, forwardto, movetofolder, redirectto, sendtextmessagenotificationto, IsValid, ObjectState | Out-File -FilePath "C:\temp\$UPN-Mailbox-Rule.txt"
Stop-Transcript