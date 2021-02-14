$Logfilepath = "C:\Powershell Log Files\Get-GetExchangeOnlineLogs$(Get-Date -f ddMMMyyyy).log"
Start-Transcript -Path $Logfilepath
#Collect all recipients from Office 365
$Recipients = Get-Recipient -ResultSize Unlimited | select PrimarySMTPAddress  
 
$MailTraffic = @{}  
foreach($Recipient in $Recipients)  
{  
    $MailTraffic[$Recipient.PrimarySMTPAddress.ToLower()] = @{}  
}  
$Recipients = $null  
  
#Collect Message Tracking Logs (These are broken into "pages" in Office 365 so we need to collect them all with a loop)  
$Messages = $null  
$Page = 1  
do  
{  
    Write-Host "Collecting Message Tracking - Page $Page..."  
    $CurrMessages = Get-MessageTrace -PageSize 5000 -Page $Page -StartDate (Get-Date).Adddays(-10) -EndDate (Get-Date) -SenderAddress $UPN | Select MessageId, Organization, Received, SenderAddress, RecipientAddress, Subject, Status, FromIP, ToIP, PSComputerName, RunspaceId, MessageTraceId
    $Page++  
    $Messages += $CurrMessages  
}
until ($CurrMessages -eq $null)
$Messages | Export-Csv "c:\temp\export.csv" -NoTypeInformation -Encoding UTF8
Stop-Transcript