$MyScriptBlock = {
    param ($TotalTime = 25)

    $CurrentTime = 0

    while ($CurrentTime -le $TotalTime) {
        Write-Progress -Activity "Counting to $TotalTime" -Status "Elapsed time: $CurrentTime seconds" -PercentComplete ($CurrentTime / $TotalTime * 100)
        Start-Sleep 1
        $CurrentTime++
    }
}