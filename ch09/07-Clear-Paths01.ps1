$Paths = (Get-ChildItem $HOME/random -Recurse).FullName
$Paths = $Paths -notmatch "^$HOME/random/dir04" | ForEach-Object { Remove-Item $PSItem }
Remove-Item $Paths