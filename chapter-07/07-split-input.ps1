$PathInfo = Import-Csv './chapter-07/07-input.csv'

# Looping construct here
$Path = $PathInfo.Path
$RetentionDays = $PathInfo.Retention
$Extension = $PathInfo.Extension
$Exclusion = $PathInfo.Exclusion
# Eng loop

$ExclusionPaths = $Exclusion -split ';'

# Some code block to handle deletion and other things

Write-Host "These $($ExclusionPaths.Count) paths will be excluded from deletion: $($ExclusionPaths -join ', ')"