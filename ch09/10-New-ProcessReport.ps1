$Processes = @{}
Get-Process | ForEach-Object { $Processes[$PSItem.Name] = $PSItem.WS/1MB }

$Report = "The computer is currently running $($Processes.Count) processes."

if ($Processes.Contains('pwsh') -or $Processes.Contains('pwsh-preview'
)) {
    $Report += "`n`nPowerShell is also running at the moment."
    $Processes.Remove('pwsh')
    $Processes.Remove('pwsh-preview')
}
else {
    $Report += "`n`nPowerShell is not running at the moment."
}

$Report += "`n`nFollowing is the list of processes currently running, sorted by name:"

$Report += "`n`n$(($Processes.GetEnumerator() | Sort-Object Name).Name -join "`n")"

$Report += "`n`nThe average working set used is $(($Processes.Values | Measure-Object -Average).Average) MB. There are $($Processes.Count) processes running, apart from PowerShell."

$Processes.Clear()

$Report += "`n`n$($Processes.Count) processes left after clearing the list."

$Report