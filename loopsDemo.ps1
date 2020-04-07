
function main
{
  do
    {
       #starting helper function
       Write-Output "`n Select 1 to deal with Services `n `n Select 2 to deal with Event logs `n `n Select 3 to deal with files `n `n Select 4 for EXIT `n"
       # Should handle gibrish input
       $choice = Read-Host -Prompt 'Input the choice'
       switch($choice)
        {
           1 {helper-func1; break}
           2 {helper-func2; break}
           3 {helper-func3; break}
        }
     }while($choice -ne 4)
}

#Helpers
function helper-func1 
{
    do
    {
        Write-Output "`n Select 1 to list all the Services `n `n Select 2 to view Running services `n `n Select 3 to view Stopped services `n `n Select 4 to start a service `n `n Select 5 to stop a service `n `n Select 6 to EXIT `n"
        $choice = Read-Host -Prompt "`n Enter the choice"
        switch($choice)
        {
           1 {Get-Service; break} 
           2 {Get-Service | Where-Object {$_.Status -eq "Running"}; break}
           3 {Get-Service | Where-Object {$_.Status -eq "Stopped"}; break}
           4 {
            $serviceName = Read-Host -Prompt "`n Enter the service name `n" #handle incorrect service names
            Start-Service -Name $serviceName #check whether it is already running or not
            Get-Service -Name $serviceName
            Write-Output `n ; break
             }

           5 {
            $serviceName = Read-Host -Prompt "`n Enter the service name `n" 
            Stop-Service -Name $serviceName
            Get-Service -Name $serviceName
            Write-Output `n; break
             }

           6 {break}
       }
     }while($choice -ne 6)
}

    
function helper-func2 
{
    do
    {
        Write-Output "`n Select 1 to just get log details `n `n Select 2 to get log details of specific entry type `n `n Select 3 to Exit `n"
        $choice = Read-Host -Prompt "`n Enter the choice"
        switch($choice)
        {
           1 {
             #Get log details of events
             $eventName = Read-Host -Prompt "`n Enter the event name"
             $data = Get-EventLog -LogName $eventName | select -First 20 
             Write-Output $data        
             }

           2 {
             #Get log details of events
             $eventName = Read-Host -Prompt "`n Enter the event name"
             $entryType = Read-Host -Prompt "`n Enter the entry type"
             $data = Get-EventLog -LogName $eventName | Where-Object {$_.EntryType -eq $entryType} | select -First 20   
             Write-Output $data
             }
             3 {break}
        }
    }while($choice -ne 3)    
}


function helper-func3 {
        Write-host "foo3"
    }

    #Entry point
    main
