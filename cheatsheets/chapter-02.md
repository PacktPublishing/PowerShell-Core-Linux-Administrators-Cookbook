# Preparing for Administration using PowerShell

Install Visual Studio Code from the repository (Ubuntu):

```bash
sudo apt install code
```

To install Visual Studio Code using the `deb` package:

```bash
sudo apt install install code_version_arch.deb
```

List the variables in a new terminal session:

```powershell
# When using a cmdlet
Get-Variable

# When using a PowerShell provider
Set-Location Variable:
Get-ChildItem .
```

To silence error output in case of errors:

```powershell
Set-Variable ErrorActionPreference SilentlyContinue
```

Working with a PowerShell profile:

```powershell
# Create the new profile
New-Item $PROFILE -ItemType File -Force

# Edit the new profile in Visual Studio Code
code $PROFILE

# Delete the profile
Remove-Item $PROFILE
```

Sample long-running line of PowerShell code, broken for readability:

```powershell
Get-ChildItem /home/$env:USERNAME/Downloads |
Where-Object {$_.LastWriteTime.Year -eq 2018} | Select-Object `
Name, LastWriteTime
```

Send command output to a file:

```powershell
# The Linux way (which works on PowerShell)
Get-Process > processes.txt

# The PowerShell way
Get-Process | Out-File processes.txt
```

Append output to a file:

```powershell
# The Linux way (which works in PowerShell)
Get-Process >> processes.txt

#  The PowerShell way
Get-Process | Out-File processes.txt -Append
```

To display the output on the terminal emulator as well as send it to a file:

```powershell
# Only the PowerShell way
Get-Process | Tee-Object ./processes.txt
```

Reading content from a file:

```bash
# The Linux way (which DOES NOT work on PowerShell)
command < input.txt
```

```powershell
# The PowerShell way
Get-Content input.txt | Remove-Item -WhatIf
```

Create new files/directories:

```powershell
# Create a new directory
New-Item -Path test-dir -ItemType Directory

# Create a complete path instead (directory inside a directory)
New-Item test-dir/child-dir -ItemType Directory -Force

# Create multiple files
New-Item ./test-dir/file1, ./test-dir/file2, ./test-dir/child-dir/file3
```

Find parameter aliases:

```PowerShell
(Get-Command Invoke-Command).Parameters.Values | select Name, Aliases
```

Call PowerShell scripts from outside of PowerShell

```PowerShell
# When the path to the script does not contain spaces
/path/to/the-script.ps1

# When the path to the script file contains a space
& '/path/to/directory with spaces/script.ps1'

# When we want the variables, aliases and functions retained in the session
. /path/to/the-script.ps1

# If there are spaces in the path, enclose it in quotes
. '/path/to/directory with spaces/script.ps1'
```

Call a PowerShell cmdlet from outside of PowerShell

```bash
# When calling a cmdlet
pwsh -c Get-ChildItem

# When calling a script
pwsh -f ./Documents/code/github/powershell/chapter-3/hello-world.ps1
```

Record actions performed at the PowerShell console

```powershell
# Start the recording
Start-Transcript -Path ./command-transcript.txt

# Perform actions on the terminal
Get-Date

Get-ChildItem .

New-Item test-transcript -ItemType Directory

New-Item -Path test-transcript/testing-transcript.txt -ItemType File

# Add contents to the newly-created file
@'
In publishing and graphic design, lorem ipsum is a placeholder text
commonly used to demonstrate the visual form of a document without relying
on meaningful content (also called greeking).
Replacing the actual content with placeholder text allows designers to
design the form of the content before the content itself has been produced.
—Wikipedia
'@ | Out-File ./test-transcript/testing-transcript.txt -Append

Remove-Item -Path ./test-transcript -Recurse

# Stop the recording
Stop-Transcript

# Read the contents of the recording
Get-Content -Path ./command-transcript.txt
```