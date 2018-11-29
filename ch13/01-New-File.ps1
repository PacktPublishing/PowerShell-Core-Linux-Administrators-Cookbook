function New-File {
    [CmdletBinding()]
    param (
        # The path to the file (or the name)
        [Parameter(Mandatory=$true, Position=0)]
        [string[]]
        $Path
    )
    Write-Debug "Entered the process block."
    foreach ($Item in $Path) {
        Write-Debug "Iterating for item, $Item."
        New-Item -Path $Item -ItemType File
    }
}