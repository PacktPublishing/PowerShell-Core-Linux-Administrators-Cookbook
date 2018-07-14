$Year = Read-Host "Enter the year (YYYY) you would like to find Mothers’ Day for"

$CurrentDay = Get-Date "01 May $Year"

while ($CurrentDay.DayOfWeek -ne 'Sunday') {
    $CurrentDay = $CurrentDay.AddDays(1)
}
$MothersDay = $CurrentDay.AddDays(7)

Write-Output "Mothers’ Day falls on $($MothersDay.ToLongDateString())."