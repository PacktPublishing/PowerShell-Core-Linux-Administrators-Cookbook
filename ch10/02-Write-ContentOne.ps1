Get-ChildItem $HOME/random/dir-04 > $HOME/random/file-list.txt

Get-ChildItem $HOME/random/dir-05 > $HOME/random/error.txt

Write-Host "Listing the contents of ~/random/dir-03 and appending the list to file-list.txt." > $HOME/random/message.txt

Get-ChildItem $HOME/random/dir-03 | Tee-Object $HOME/random/file-list.txt -Append