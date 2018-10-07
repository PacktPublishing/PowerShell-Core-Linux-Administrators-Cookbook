function New-File {
    [CmdletBinding()]
    param (
        # The path to the file (or the name)
        [Parameter(Mandatory=$true, Position=0)]
        [string[]]
        $Path
    )
    begin {
        Write-Debug "Entered the begin block."
        Write-Host "$(Get-Date)"
    }
    process {
        Write-Debug "Entered the process block."
        foreach ($Item in $Path) {
            Write-Debug "Iterating for item, $Item."
            New-Item -Path $Path -ItemType File
        }
    }
    end {
        Write-Debug "Entered the end block."
    }
}

New-File One.txt