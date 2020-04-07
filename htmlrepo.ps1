#get required details from services
$data = Get-Service | Select-Object Name, StartType, Status |
        Sort-Object -Property Status |
        Select -First 200

$date = Get-Date -Format "dd.MM.yyyy, HH:mm"

#Converting to HTML formate
$data | ConvertTo-Html -Title "ServicecReport" -PreContent "<h1>Report displaying service Type and Status of $env:USERNAME at $date</h1>" -CSSUri "HtmlReport.css" |
        Set-Content "HtmlReportGold.html"