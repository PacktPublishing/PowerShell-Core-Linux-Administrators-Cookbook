function New-File {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param (
        # The path to the file (or the name)
        [Parameter(Mandatory=$true, Position=1, ValueFromPipeline=$true)]
        [string]
        $Path
    )
    begin {
        Write-Host "$(Get-Date)"
        $commonParameters = @()

        if ($WhatIfPreference) {
            $commonParameters.Add('WhatIf', $true)
        }
        if ($ConfirmPreference) {
            $commonParameters.Add('Confirm', $true)
        }
    }
    process {
        New-Item -Path $Path -ItemType File @commonParameters
    }
    end {}
}