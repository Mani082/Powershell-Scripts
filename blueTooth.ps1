
param(
    [Parameter(Mandatory=$true)]
    [string]$action,
    [string]$cmd
)

if($action -eq "Start")
{
    $cmd=Start-service -Name BluetoothUserService_10a560
}
else
{
    $cmd=Stop-service -Name BluetoothUserService_10a560
}


$blueTooth = Get-service -Name BluetoothUserService_10a560

if($action -eq "Start")
{   Write-Output " "
    Write-Output "Starting the Bluetooth support service.."
    $cmd
    $blueTooth
}
if($action -eq "Stop")
{
    Write-Output " "
    Write-Output "Stopping the Bluetooth support service.."
    $cmd
    $blueTooth
}
