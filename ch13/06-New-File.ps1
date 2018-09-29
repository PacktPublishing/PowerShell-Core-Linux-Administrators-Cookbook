function New-File {
    param (
        # The path to the file (or the name)
        [Parameter(Mandatory=$true, Position=1, ValueFromPipeline=$true)]
        [string]
        $Path
    )
    begin {
        Write-Host "$(Get-Date)"
    }
    process {
        New-Item -Path $Path -ItemType File
    }
    end {}
}