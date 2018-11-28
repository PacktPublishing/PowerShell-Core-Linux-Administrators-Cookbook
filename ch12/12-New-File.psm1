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
        SupportsShouldProcess=$true,
        DefaultParameterSetName='File'
    )]
    param (
        # The path to the file (or the name)
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline, ParameterSetName='File')]
        [string[]]
        $Path,

        # Whether files need to be generated
        [Parameter(Mandatory=$true, ParameterSetName='Generate')]
        [switch]
        $Generate,

        # Number of files to be generated
        [Parameter(Mandatory=$false, ParameterSetName='Generate')]
        [int]
        $Count=1
    )
    begin {
        Write-Host "$(Get-Date)"
    }
    process {
        if ($Generate) {
            $Path = New-FileName -Count $Count
        }
        foreach ($Item in $Path) {
            if ($PSCmdlet.ShouldProcess("$PsScriptRoot", "Create $Item")) {
                New-Item -Path $Item -ItemType File
            }
        }
    }
    end {}
}

Export-ModuleMember New-File

$MyInvocation.MyCommand.ScriptBlock.Module.OnRemove = {
    Write-Output "Module cleaned up."
}

Register-EngineEvent PowerShell.Exiting {
    Remove-Module '12-New-File'
}