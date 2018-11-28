# Change this to match ./path/of/your/choice/ from the aforementioned scripts
$LabPath = "$HOME/random"

$Today = Get-Date
$TotalFileSize = 0

$FilesToDelete = Get-ChildItem $LabPath -Recurse -File | Where-Object {[math]::Floor(($Today - $_.LastWriteTime).TotalDays) -eq 30}


Write-Host "The following files will be deleted:"
Write-Host $FilesToDelete.FullName

foreach ($File in $FilesToDelete) {
    $TotalFileSize += $File.Length
    Remove-Item -Path $File -WhatIf
}

Write-Host "Total space cleared: $([math]::Round($TotalFileSize/[math]::Pow(1024, 2))) MB"
