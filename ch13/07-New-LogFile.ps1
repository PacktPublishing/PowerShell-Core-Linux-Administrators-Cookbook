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
        New-Item "$Path/$Name" -ItemType File -ErrorAction Stop
    }
    catch [System.IO.DirectoryNotFoundException] {
        New-Item $Path -ItemType Directory -Force
        New-LogFile
    }
    catch {
        "Some error other than DirectoryNotFound"
    }
}