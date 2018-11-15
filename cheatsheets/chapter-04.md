# Passing Data through the Pipeline

Clone the [repository from GitHub](https://github.com/PacktPublishing/PowerShell-6.0-Linux-Administration-Cookbook) or download the [lab setup script](https://github.com/PacktPublishing/PowerShell-6.0-Linux-Administration-Cookbook/blob/master/chapter-05/Initialize-PacktPs6CoreLinuxLab.ps1) from the repository.

Run the script to create the files for the lab.

```powershell
& ~/Downloads/Initialize-PacktPs6CoreLinuxLab.ps1
```

List out the contents of a directory:

```powershell
Get-ChildItem -Path .
```

Omit the `Mode` column from the output:

```powershell
Get-ChildItem -Path . | Select-Object LastWriteTime, Length, Name
```

Change the name of a column:

```powershell
Get-ChildItem -Path . | Select-Object Name, Length, @{Name='Modified'; Expression={$_.LastWriteTime}}
```

Pick only the year of modification using thecalculated property notation:

```powershell
Get-ChildItem -Path . | select Name, Length, @{Name='DaysSinceModification'; Expression={[math]::Round(((Get-Date) - $_.LastWriteTime).TotalDays)}}
```

Pick a certain number of ourput items:

```powershell
# First five items
Get-ChildItem . | Select-Object -First 5

# Last five items
Get-ChildItem . | Select-Object -Last 5

# Skip the first three items
Get-ChildItem . | Select-Object -Skip 3

# Pick the fourth item from the output
Get-ChildItem . | Select-Object -Index 3
```

Expand the elements within a property:

```powershell
# The pwsh process
Get-Process pwsh | Select-Object -ExpandProperty Threads

# Select specific properties from within the property
Get-Process pwsh | Select-Object -ExpandProperty Threads | Select-Object -Property Id, PriorityLevel, StartTime
```

Filter out files that are over 0 bytes in size:

```powershell
Get-ChildItem -Path . | Where-Object -Property Length -GT -Value 0
```

Filter based on two (or more) properties:

```powershell
# Pick all the JPG files larger than 0 bytes
Get-ChildItem -Path . | Where-Object -FilterScript {$_.Length -GT 0 -and $_.Extension -EQ '.jpg'}

# Pick files as above, whose names start with c
Get-ChildItem -Path . | Where-Object -FilterScript {$_.Length -GT 0 -and $_.Extension -EQ '.jpg' -and $_.Name -CMatch '^c'}
```

Group output based on a property:

```powershell
Get-ChildItem . -File | Group-Object Extension

# Do the same, but do not show the file names
Get-ChildItem -Path . -File | Group-Object -Property Extension -NoElement

# Show only the JPG files from the lot
Get-ChildItem -Path . -File | Group-Object -Property Extension | Where-Object Name -EQ .jpg | Select-Object -ExpandProperty Group
```

Sort the output based on a property:

```powershell
Get-ChildItem -Path . -File | Sort-Object -Property Length

# Sort in the descending order
Get-ChildItem -Path . -File | Sort-Object -Property Length -Descending

# Pick the largest three files in the lot
Get-ChildItem -Path . -File | Sort-Object -Property Length -Descending -Top 3
```

(Dummy-)delete top two largest files of each type from a directory (if there is only one file of each type, that would be left alone):

```powershell
Get-ChildItem -Path . -File | 
Group-Object -Property Extension | 
Where-Object Count -GT 1 | 
ForEach-Object {$_.Group | 
Sort-Object Length -Bottom 2} | 
Remove-Item -WhatIf
```

The long way to get directory contents, which demonstrates accepting values through the pipeline, `ByPropertyName`:

```powershell
Get-Item . | Select-Object @{Name = 'LiteralPath'; Expression = {$_.FullName}} | Get-ChildItem
```

Import content into PowerShell and work with the object:

```powershell
# First export the content so we have some real data
Get-ChildItem -Path . | Select-Object Name, FullName, CreationTime, LastWriteTime, Extension, Length | Export-Csv ./file-list.csv

# Import the content and get the year when the files were created; what type of object is it?
(Import-Csv ./file-list.csv).CreationTime.Year | Get-Member

# Export the content with the object type intact
Get-ChildItem -Path . | Export-Clixml ./file-list.xml

# Import the content and get the year when the files were created; what type of object is it?
(Import-Clixml ./file-list.xml).CreationTime.Year | Get-Member
```