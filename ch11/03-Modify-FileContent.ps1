#region Copy files to a backup directory before proceeding:
New-Item $HOME/random/backup/ -ItemType Directory
Copy-Item $HOME/random/message.txt, $HOME/random/file-list.txt, $HOME/random/error.txt $HOME/random/backup/

# Verbose version: Copy-Item -Path $HOME/random/message.txt, $HOME/random/file-list.txt, $HOME/random/error.txt -Destination $HOME/random/backup/
#endregion

#region Commence operations
Set-Content $HOME/random/message.txt "Successfully sent the contents of ~/random/dir-03 and appending the list to file-list.txt"

# Verbose version: Set-Content -Path $HOME/random/message.txt -Value  "Successfully sent the contents of ~/random/dir-03 and appending the list to file-list.txt"

Add-Content $HOME/random/message.txt, $HOME/random/file-list.txt (Get-Date)

# Vervose version: Add-Content -Path $HOME/random/message.txt, $HOME/random/file-list.txt -Value (Get-Date)

Clear-Content $HOME/random/error.txt

# Verbose version: Clear-Content -Path $HOME/random/error.txt
#endregion

"Here are the contents before and after the modifications:"

"Message (before):"
Get-Content $HOME/random/backup/message.txt

"Message (now):"
Get-Content $HOME/random/message.txt

Read-Host -Prompt "Press ENTER to continue"

"File list (before):"
Get-Content $HOME/random/backup/file-list.txt

"File list (now):"
Get-Content $HOME/random/file-list.txt

Read-Host -Prompt "Press ENTER to continue"

"Error (before):"
Get-Content $HOME/random/backup/error.txt

"Error (now):"
Get-Content $HOME/random/error.txt