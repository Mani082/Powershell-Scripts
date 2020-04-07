param(
    [Parameter(Mandatory=$true)]
    [string]$logName,
    [Parameter(Mandatory=$true)]
    [string]$entryType
)
#Get log details of events
$data = Get-EventLog -LogName $logName | Where-Object {$_.EntryType -eq $entryType} | select -First 20   
Write-Output $data
#store it in file
$data | Out-File logInfo.txt