$Processes = @{}
Get-Process | ForEach-Object { $Processes[$PSItem.Name] = $PSItem.WS/1MB }
$Processes['pwsh']