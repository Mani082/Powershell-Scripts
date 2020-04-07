Get-Service |format-list *
Get-Service |format-table name, canstop
Get-Service |Sort-Object -Property displayname |format-table name, canstop
Get-Service |Sort-Object -Property displayname |format-table displayname, canstop |out-file services.txt
Get-Service |Out-GridView 