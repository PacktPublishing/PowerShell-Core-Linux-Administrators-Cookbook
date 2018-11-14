$Iteration = 0
do {
    $AllDirectories = (Get-ChildItem -Path $HOME/random -Recurse -Directory).FullName
    $EmptyDirectories = $AllDirectories | Where-Object {(Get-ChildItem $PSItem).Count -eq 0}
    $EmptyDirectories | Remove-Item

    Write-Output "Iteration $Iteration. Removed the following $($EmptyDirectories.Count) directories."
    $EmptyDirectories
    $Iteration++
} while ($EmptyDirectories.Count -gt 0)