function Start-Count {
    <#
    .SYNOPSIS
    This cmdlet counts seconds by accepting a from and a to value. The from value is optional.
    
    .DESCRIPTION
    This cmdlet is a counting function. It accepts two parameters: the TotalTime being the "to" and CurrentTime being the "from". CurrentTime defaults to 0 if not specified.
    
    .PARAMETER CurrentTime
    The starting point, in seconds.
    
    .PARAMETER TotalTime
    The stopping point, in seconds.
    
    .EXAMPLE
    Start-Count 10 15
    
    .NOTES
    Created as a demo for PowerShell 6.0 Linux Administration Cookbook
    #>
    param (
        # The current time, or the starting point
        [Parameter(Mandatory=$false)]
        [Alias("CT", "From")]
        [int]
        $CurrentTime=0,

        # The total number of seconds to count
        [Parameter(Mandatory=$false, Position=1)]
        [Alias("TT", "To")]
        [ValidateSet(5, 10, 15, 20)]
        [int]
        $TotalTime=10
    )

    while ($CurrentTime -le $TotalTime) {
        Write-Progress -Activity "Counting to $TotalTime" -Status "Counting: $CurrentTime seconds" -PercentComplete ($CurrentTime / $TotalTime * 100)
        Start-Sleep 1
        $CurrentTime++
    }
}