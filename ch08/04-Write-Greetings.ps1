$GuestsRaw = Read-Host "Enter the guest names, separated by commas"
$Guests = $GuestsRaw -split ",$([regex]'[\s]*')"

$Guests | ForEach-Object { Write-Output "Welcome, $PSItem!" }