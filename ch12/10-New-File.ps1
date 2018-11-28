function Main {
    New-FileName -Count 10 | New-File
}

function New-FileName {
    param (
        # The name of the file
        [Parameter(Mandatory=$false)]
        [string]
        $Prefix='File',

        # The number of files to be generated
        [Parameter(Mandatory=$false, Position=1)]
        [int]
        $Count=1
    )

    begin {
        $InitCount = 1
    }

    process {
        while ($InitCount -le $Count) {
            Write-Output $Prefix$InitCount
            $InitCount++
        }
    }
}

function New-File {
    [CmdletBinding(
        ConfirmImpact='High',
        SupportsShouldProcess=$true
    )]
    param (
        # The path to the file (or the name)
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline)]
        [string[]]
        $Path
    )
    begin {
        Write-Host "$(Get-Date)"
    }
    process {
        foreach ($Item in $Path) {
            if ($PSCmdlet.ShouldProcess("$PsScriptRoot", "Create $Item")) {
                New-Item -Path $Item -ItemType File
            }
        }
    }
    end {}
}

. Main