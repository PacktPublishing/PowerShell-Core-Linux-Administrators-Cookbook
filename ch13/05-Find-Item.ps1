ping ghostname

if (!$?) {
    Write-Host "PowerShell seems to have encountered an error while running the last command."
}

Write-Host "The exit code for the last operation is $LASTEXITCODE."

Remove-Variable LASTEXITCODE

Get-Item $HOME/random/randompackage.zip -ErrorAction SilentlyContinue

if (!$?) {
    Write-Host "PowerShell seems to have encountered an error while running the last command."
}

Write-Host "The exit code for the last operation is $LASTEXITCODE."