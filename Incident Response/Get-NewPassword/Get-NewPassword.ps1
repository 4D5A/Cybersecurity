$Random = New-Object -TypeName PSObject
$Random | Add-Member -MemberType ScriptProperty -Name "Random" -Value {('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[{]}\|;:,<.>/?'.ToCharArray() | Sort-Object {Get-Random})[0..30] -join ''}
Write-Host $Random.Random