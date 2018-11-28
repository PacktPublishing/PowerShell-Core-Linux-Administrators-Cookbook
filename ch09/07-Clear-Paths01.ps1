$Paths = (Get-ChildItem $HOME/random -Recurse).FullName
$Paths = $Paths | Where-Object {$PSItem -notmatch "^$HOME/random/dir-04"}
Write-Output "Here is the list of paths within the lab directory, without those within dir-04:`n`n"
$Paths