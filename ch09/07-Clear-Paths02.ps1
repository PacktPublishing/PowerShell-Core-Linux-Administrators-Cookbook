$AllPaths = New-Object -TypeName System.Collections.ArrayList
foreach ($Path in (Get-ChildItem $HOME/random -Recurse)) {
    [void]$AllPaths.Add($Path.FullName)
}

$PathsToExclude = $AllPaths -match "^$HOME/random/dir-04"

foreach ($Dir4Path in $PathsToExclude) {
    $AllPaths.Remove($Dir4Path)
}

Write-Output "Here is the list of paths within the lab directory, without those within dir-04:`n`n"
$AllPaths