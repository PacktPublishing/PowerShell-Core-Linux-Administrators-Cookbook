function New-LogFile {
    param (
        # The path to the log file
        [Parameter(Mandatory=$false)]
        [string]
        $Path = "$HOME/random/LogDir",

        # The name of the log file
        [Parameter(Mandatory=$false)]
        [string]
        $Name = 'MyLog.log'
    )

    try {
        Write-Verbose "Creating the file, $Name at $Path."
        New-Item "$Path/$Name" -ItemType File -ErrorAction Stop
    }
    catch [System.IO.DirectoryNotFoundException] {
        Write-Verbose "System.IO.DirectoryNotFoundException encountered."
        Write-Verbose "Creating the directory, $Path."
        New-Item $Path -ItemType Directory -Force
        Write-Verbose "Calling the function."
        New-LogFile
    }
    catch {
        Write-Verbose "Catch-all. There was an error."
        Write-Error $_
    }
}
New-LogFile -Verbose 4>> verbose.log 2>> error.log