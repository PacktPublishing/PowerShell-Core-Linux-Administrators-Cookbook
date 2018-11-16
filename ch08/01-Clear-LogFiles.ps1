# Change this to match ./path/of/your/choice/ from the aforementioned scripts
$LabPath = "$HOME/random"

$Today = Get-Date
$TotalFileSize = 0

$AllFiles = Get-ChildItem $LabPath -Recurse -File
$FilesToDelete = $AllFiles | Where-Object {[math]::Floor(($Today - $_.LastWriteTime).TotalDays) -eq 30}


"The following files will be deleted:"
$FilesToDelete.FullName

foreach ($File in $FilesToDelete) {
    $TotalFileSize += $File.Length
    Remove-Item -Path $File -WhatIf
}

"Total space cleared: $([math]::Round($TotalFileSize/[math]::Pow(1024, 2))) MB"