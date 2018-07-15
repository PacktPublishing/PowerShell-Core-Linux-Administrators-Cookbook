# Using Variables and Objects

Save an entire object into a variable:

```powershell
$Process = Get-Process
```

Work with environment variables:

```powershell
# List out all the environment variables
Get-ChildItem env:

# Get information on a specific variable
Get-ChildItem Env:/PATH
```

Quickly create a custom object:

```powershell
$MyCustomObject = [pscustomobject]@{ 
    Name = 'Prashanth Jayaram'
    Title = 'PowerShell'
    Publisher = 'Packt' 
}
```

Add a member to an existing object:

```powershell
$MyCustomObject | Add-Member -MemberType NoteProperty -Name 'Location' -Value 'United States'
```

Access a single property from the object:

```powershell
$MyCustomObject.Name
```

Remove a member from an object:

```powershell
$MyCustomObject.PsObject.Properties.Remove('Location')
```

Create a custom object from an output object:

```powershell
# Assign an object to a variable
$Process = (Get-Process | Select-Object Name, Id, WS, StartTime)[4]

# Create a new object
$CustomProcess = New-Object -TypeName PSObject -Property @{
    ProcessName = $Process.Name
    ProcessId = $Process.Id
    WorkingSet = $Process.WS
    StartedAt = $Process.StartTime
}

# To have the object properties in a certain sequence
$CustomProcess = [ordered]@{
    ProcessName = $Process.Name
    ProcessId = $Process.Id
    WorkingSet = $Process.WS
    StartedAt = $Process.StartTime
} 
New-Object -TypeName PSObject -Property $CustomProcess

# Modify the properties and their values to suit your needs
$CustomProcess = [ordered]@{
    ProcessName = $Process.Name
    ProcessId = $Process.Id
    WorkingSet = $Process.WS
    RunningMins = [math]::Floor(((Get-Date) - $Process.StartTime).TotalMinutes)
}
New-Object -TypeName PsObject -Property $CustomProcess
```

Add members to objects without recreating the entire object:

```powershell
# Get the base object
$FilesWithAge = Get-ChildItem . | Select-Object Name, Length, LastWriteTime

# Add a member to the object
$FilesWithAge | Add-Member -MemberType ScriptProperty -Name Age -Value { [math]::Round(((Get-Date) - $this.LastWriteTime).TotalDays) }
```

Update the type data using cmdlets:

```powershell
Update-TypeData -TypeName System.IO.FileInfo -MemberType ScriptProperty -MemberName Age -Value { [math]::Round(((Get-Date) - $this.LastWriteTime).TotalDays) }
```

Basic structure of the XML used to extend the type data:

```xml
<?xml version="1.0" encoding="utf-8" ?>
<Types>
 <Type>
   <Name></Name>
   <Members>
     <AliasProperty>
       <Name></Name>
       <ReferencedMemberName></ReferencedMemberName>
     </AliasProperty>
   </Members>
 </Type>
</Types>
```

Break down the XML to understand the different kinds of properties:

```xml
<!-- An alias property -->
<AliasProperty>
    <Name>Modified</Name>
    <ReferencedMemberName>LastWriteTime</ReferencedMemberName>
</AliasProperty>

<!-- A script property -->
<ScriptProperty>
    <Name>Age</Name>
    <GetScriptBlock>
        [math]::Round(((Get-Date) - $this.LastWriteTime).TotalDays)
    </GetScriptBlock>
</ScriptProperty>

<!-- A note property -->
<NoteProperty>
    <Name>ItemType</Name>
    <Value>File</Value>
</NoteProperty>
```

Extend the type data using an XML file:

```powershell
Update-TypeData -PrependPath '~/Documents/code/github/powershell/chapter-06/CustomTypes.ps1xml'
```

Remove custom type data:

```powershell
# Start with the command that gives you the object whose type data you extended
$TypeData = Get-ChildItem -File | Get-Member | Select-Object -ExpandProperty TypeName -Unique

# Ensure there has been a type data extension; notice the members
Get-TypeData -TypeName $TypeData | Select-Object -ExpandProperty Members

# Remove the custom type data
Remove-TypeData -TypeName $TypeData
```