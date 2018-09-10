Get-ChildItem $HOME/random/dir-04 | Out-File $HOME/random/file-list.txt

Get-ChildItem $HOME/random/dir-05 2>&1 | Out-File $HOME/random/error.txt

Write-Host "Listing the contents of ~/random/dir-03 and appending the list to file-list.txt." 6>&1 | Out-File $HOME/random/message.txt

Get-ChildItem $HOME/random/dir-03 | Tee-Object $HOME/random/file-list.txt -Append

<# Alternatives, using only operators:
Get-ChildItem $HOME/random/dir-04 > $HOME/random/file-list.txt

Get-ChildItem $HOME/random/dir-05 2>&1 > $HOME/random/error.txt

Write-Host "Listing the contents of ~/random/dir-03 and appending the list to file-list.txt." 6>&1 > $HOME/random/message.txt

Get-ChildItem $HOME/random/dir-03 | Tee-Object $HOME/random/file-list.txt -Append
#>