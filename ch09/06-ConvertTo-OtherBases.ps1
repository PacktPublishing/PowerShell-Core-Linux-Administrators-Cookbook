$InputString = Read-Host "Enter an integer"

Write-Host "Octal representation: " -NoNewline
[Convert]::ToString($InputString, 8)

Write-Host "Hexadecimal representation: " -NoNewline
[Convert]::ToString($InputString, 16)

Write-Host "Binary representation: " -NoNewline
[Convert]::ToString($InputString, 2)