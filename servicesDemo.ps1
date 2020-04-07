New-Item C:\Scripts\testFolder -ItemType Directory

New-Item C:\Scripts\testFolder\testFile.txt -ItemType File

$data = Get-Service | Where-Object {$_.Status -eq "Running"} | select -First 40

$data | Out-File Warning.txt

Copy-Item -Path C:\Scripts\Warning.txt -Destination C:\Scripts\testFolder\testFile.txt