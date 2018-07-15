# Installation, Reference and Help

Get help on any command:

```powershell
# Get-Help <cmdlet name>
Get-Help Get-Command
```

Get more help on a certain cmdlet (e.g. `Get-Command`):

```powershell
# Full help text
Get-Help Get-Command -Full

# Show examples
Get-Help Get-Command -Examples

# Read the help in a browser
Get-Help Get-Command -Online
```

Update the help information:

```powershell
Update-Help
```

Select specific string from the output:

```powershell
Get-Help Get-Command | Out-String -Stream | Select-String 'common'
```

Get help on a specific parameter:

```powershell
Get-Help Get-Command -Parameter Noun
```

Work with `about_` topics:

```powershell
# List out all the `about_` topics
Get-Help about_*

# Pick the topic you would like to read about and then
Get-Help about_Modules
```

Search for cmdlets:

```powershell
# Discover cmdlets based on the noun
Get-Command -Noun Process

# Dicsover cmdlets based on the verb as well
Get-Command -Verb Get -Noun Process

# Dicsover cmdlets based on the module
Get-Command -Noun Process -Module Microsoft.PowerShell.Management
```

Search for a module in the PowerShell Gallery

```powershell
Find-Module 'Docker'
```

Install a module:

```powershell
# Install directly from the PowerShell Gallery
Install-Module 'Docker'

# To save the module and import it instead
# Create a folder where you would like to store the modules:
New-Item -ItemType Directory -Path ~/PSModules

# Save the module in the directory you just created
Save-Module Docker ~/PsModules

# Import the module
Import-Module ~/PsModules/Docker/1.3.2/Docker.psm1
```

Update a module:

```powershell
Update-Module Docker
```

Remove a module from the system:

```powershell
# Would work on the modules installed with `Install-Module`
Uninstall-Module Docker

# For modules you saved, simply delete the directory that contains the module files
Remove-Item ~/PsModules/Docker -Recurse
```

List out all the providers in PowerShell:

```powershell
Get-PsProvider
```

Navigate to one of the drives in one of the providers:

```powershell
Set-Location Alias:
```