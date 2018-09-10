$ThresholdDate = (Get-Date).AddDays(-7)

Get-ChildItem $HOME/random -rec -na *.mp4  | Where-Object { $_.CreationTime -lt $ThresholdDate -and $_.Length -gt 100KB }

# Verbose version: Get-ChildItem $HOME/random -Recurse -Name *.mp4  | Where-Object -FilterScript { $PSItem.CreationTime -lt $ThresholdDate -and $PSItem.Length -gt 100KB }

Get-ChildItem $HOME/random -Recurse | Sort-Object Length -Descending | Select-Object -First 5
# Verbose version: Get-ChildItem -Path $HOME/random -Recurse | Sort-Object -Property Length -Descending | Select-Object -First 5