function New-File {
    param (
        # The path to the file (or the name)
        [Parameter(Mandatory=$true, Position=0)]
        [string[]]
        $Path
    )
    begin {
        Write-Host "$(Get-Date)"
    }
    process {
        foreach ($Item in $Path) {
            New-Item -Path $Item -ItemType File
        }
    }
    end {}
}