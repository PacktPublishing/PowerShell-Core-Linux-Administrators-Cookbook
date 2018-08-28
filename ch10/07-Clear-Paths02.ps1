$PathsToDelete = New-Object -TypeName System.Collections.ArrayList
foreach ($Path in Get-ChildItem $HOME/random -Recurse) {
    [void]$PathsToDelete.Add($Path.FullName)
}

$PathsToPreserve = $PathsToDelete -match "^$HOME/random/dir-04"

foreach ($Dir4Path in $PathsToPreserve) {
    $PathsToDelete.Remove($Dir4Path)
}

Remove-Item $PathsToDelete