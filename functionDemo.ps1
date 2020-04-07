function add
{
param([int]$num1 = 1, [int]$num2 = 2)
$sum = $num1 + $num2
Write-Output $sum
}