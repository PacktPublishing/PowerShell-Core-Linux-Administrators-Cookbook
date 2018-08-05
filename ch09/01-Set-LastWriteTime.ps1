function Set-LastWriteTime {
    param (
        # Path to the random directory
        [Parameter(Mandatory=$false)]
        [string]
        $Path=(Join-Path $HOME -ChildPath random)
    )
    begin {
        $DateToSet = (Get-Date).AddDays(-25)
        $Files = Get-ChildItem -Path $Path -Recurse -File
        $NewerFiles = $Files | Select-Object -First 12
        $OlderFiles = $Files | Select-Object -Last 12
    }
    process {
        foreach ($File in $NewerFiles) {
            (Get-Item $File).LastWriteTime = $DateToSet
        }
        $DateToSet = $DateToSet.AddDays(-5)
        foreach ($File in $OlderFiles) {
            (Get-Item $File).LastWriteTime = $DateToSet
        }
    }
}
Set-LastWriteTime