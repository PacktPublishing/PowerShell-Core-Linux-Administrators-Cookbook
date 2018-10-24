Get-Item $HOME/random/randompackage.zip -ErrorAction SilentlyContinue

if (!$?) {
    Write-Host "PowerShell seems to have encountered an error."
}

Write-Host "The exit code for the last operation is $LASTEXITCODE."