function New-File {
    [CmdletBinding(
        ConfirmImpact='High',
        SupportsShouldProcess=$true
    )]
    param (
        # The path to the file (or the name)
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [string[]]
        $Path
    )
    begin {
        Write-Host "$(Get-Date)"
    }
    process {
        foreach ($Item in $Path) {
            if ($PSCmdlet.ShouldProcess("$PsScriptRoot", "Create $Path")) {
                New-Item -Path $Path -ItemType File
            }
        }
    }
    end {}
}