# Handling Files and Directories

To read contents from a file:

```powershell
# To get everything within the file
Get-Content './path/to/file.ext'

# To get the first, say, 5 lines from the file, as a single block
Get-Content './path/to/file.ext' -ReadCount 7 | Select-Object -First 1

# To get the last, say, 5 lines of the file
Get-Content './path/to/file.ext' -Tail 5

# If you would like to keep the file open for reading, such as when reading logs at the terminal
Get-Content './path/to/file.ext' -Tail 5 -Wait

# To get, say, the eleventh to the thirteenth lines of the file
Get-Content './path/to/file.ext' | Select-Object -Skip 10 -First 3

# To measure the number of characters, words and lines in the file
Get-Content './path/to/file.ext' | Measure-Object -Character -Word -Line

# Get-Content imports contents line-by-line. Each line is a separate object. If you would like all the contents as a single block, use
Get-Content './path/to/file.ext' -Raw
```

To send output to a file

```powershell
# Let us assume you want to send the current date to a file


# Using an operator
Get-Date > ./path/to/output-file.txt

# Using a cmdlet
Get-Date | Out-File ./path/to/output-file.txt

# To send errors to a file (by "polluting" the Success stream)
Get-Content ./nonexistent/path.ext 2>&1 | Out-File ./path/to/desired-file.txt

# To send errors to a file (by not "polluting" the Success stream)
Get-Content ./nonexistent/path.ext 2> ./path/to/desired-file.txt

# To send output of Write-Host or Write-Information to a file (by "polluting" the Success stream)
Write-Host "This is just a host message" 6>&1 | Out-File ./path/to/desired-file.txt

# Alternative, using only redirection operators
Write-Host "This is just a host message" 6>&1> ./path/to/desired-file.txt

# To send output of Write-Host or Write-Information to a file (by not "polluting" the Success stream)
Write-Host "This is just a host message" 6> ./path/to/desired-file.txt

# To send contents to both, a file, as well as down the pipeline
Get-Date | Tee-Object ./path/to/desired-file.txt
# In this case, since no pipeline follows Tee-Object, the ouptut will appear on the host
```

Here is a list of all the streams in PowerShell, in order:

1. Success stream
2. Error stream
3. Warning stream
4. Verbose stream
5. Debug stream
6. Information stream

Today, the Information stream also handles content sent to the host. The host was not part of any stream until PowerShell 5.0.

Only the contents of the Success stream go through the pipeline. Therefore, if the contents of any other stream are to be sent to through the pipeline, the content must be redirected to the Success stream first.

To manipulate the contents of a file:

```powershell
# To send contents to a file using an alternate method or replace the contents
Set-Content './path/to/file.ext' "The content that you would like the file to have"

# To add content to a file
Add-Content './path/to/file.ext' "The content you would like to add to the file"

# To clear contents of a file
Clear-Content './path/to/file.ext'
```

To search for a string in a file:

```powershell
# A simple listing of all occurrences
Select-String -Pattern 'MyPattern' -Path './path/to/file.ext'

# To get the context of each of the occurrences (two lines before and after the occurrence)
Select-String -Pattern 'MyPattern' -Path './path/to/file.ext' -Context 2, 2

# To perform a search on multiple files excluding a few
Select-String -Pattern 'MyPattern' -Path './path/to/*.ext' -Exclude '*ExclusionFilenamePattern*'
```

To know where the script is running from (querying within the script, not outside)

```powershell
$PsScriptRoot
```

To know the complete path to the script that was run (querying within the script, not outside):

```powershell
$PsCommandPath
```

To create paths irrespective of the platform:

```powershell
# Simple path join
Join-Path -Path 'DesiredPath' -ChildPath 'DesiredChildPath'

# Creating a single child path within multiple parent paths
Join-Path /home, /etc, /var, /boot -ChildPath MyDir

# Creating multiple child paths within a single parent path
'file1.txt', 'file2.txt', 'file3.txt' | ForEach-Object { Join-Path -Path $HOME/dir/ -ChildPath $PSItem }
```

To search for the existence of paths with a certain pattern (using a wildcard)

```powershell
# To simply resolve all the paths that match that pattern
Resolve-Path /home/*/random

# To split paths at the path separator
Split-Path -Parent # Gives the path omitting the last location, `random` in this case
Split-Path -Leaf # Shows the last location `random`, in this case
```

To actually create files/directories at the paths you created using `Join-Path`

```powershell
Join-Path dir-01, dir-02, dir-03, dir-04 -ChildPath demo.txt | ForEach-
Object { New-Item $PSItem -ItemType File }
```

To rename files/directories

```powershell
Rename-Item -Path oldname.ext -NewName newname.ext
```

To copy items from one point to another

```powershell
Copy-Item -Path /path/to/file.ext -Destination ./destination/directory # This retains the file name
```

To delete a file/directory

```powershell
# To delete a file
Remove-Item ./path/to/file.ext

# To delete a directory that contains items within itself
Remove-Item ./path/to/directory/ -Recurse
# If `-Recurse` is not used, and PowerShell finds contents within the specified directory, it would prompt whether you would like to go with a recursive deletion
```

To convert JSON into a PowerShell object:

```powershell
ConvertFrom-Json 'JSON string here' # Yup, it's that simple
```