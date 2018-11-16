# Change this to match ./path/of/your/choice/ from the aforementioned scripts
$LabPath = "$HOME/random"

$Today = Get-Date
$TotalFileSize = 0

$AllFiles = Get-ChildItem $LabPath -Recurse -File
$FilesToDelete = $AllFiles | Where-Object {[math]::Floor(($Today - $_.LastWriteTime).TotalDays) -eq 30}


Write-Host "The following files will be deleted:"
Write-Host $FilesToDelete.FullName

foreach ($File in $FilesToDelete) {
    $TotalFileSize += $File.Length
    Remove-Item -Path $File -WhatIf
}

New-Object -TypeName psobject -Property @{
    TotalFiles = $AllFiles.Count
    FilesToDelete = $FilesToDelete.Count
    SpaceCleared = $TotalFileSize
}