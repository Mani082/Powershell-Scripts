#New Directory
New-Item C:\Scripts\testFolder -ItemType Directory

#New File
New-Item C:\Scripts\testFolder\testFile.txt -ItemType File

#Get log details of warnings
$data = Get-EventLog -LogName System | Where-Object {$_.EntryType -eq "Warning"} | select -First 40
   
#Write-Output $data
$data | Out-File Warning.txt

#copy it to different location
Copy-Item -Path C:\Scripts\Warning.txt -Destination C:\Scripts\testFolder\testFile.txt