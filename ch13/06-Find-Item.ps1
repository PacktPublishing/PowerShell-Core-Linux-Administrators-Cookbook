Get-Item $HOME/random/randompackage.zip -ErrorAction SilentlyContinue

if (!$?) {
    Write-Host "PowerShell seems to have encountered an error while running the last command."
}

$Error | Select-Object -Property *