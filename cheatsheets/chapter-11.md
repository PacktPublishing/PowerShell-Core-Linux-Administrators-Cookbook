# Building Scripts and Functions

When calling a script, the path to which contains a space (without actually retaining anything from the script, in the session)

```powershell
& './path to/script.ps1'
```

When the entities within the script (such as variables or functions) have to be retained in the session:

```powershell
. './path to/script.ps1'
```

To read content from the console:

```powershell
Read-Host -Prompt "Enter prompt here"
```

To display the progress of execution

```powershell
$TerminatingCondition = 25 # (I'm counting to 25 seconds)
$CurrentCondition = 0 # (You know this part now)

do {
    Write-Progress -Activity 'Counting to 25' -Status "Elapsed time: $CurrentCondition seconds" -PercentComplete ($CurrentCondition / $TerminatingCondition * 100)
    Start-Sleep 1 # Because this should happen at a human speed
    $CurrentCondition++ # Because progress is everything
} until ($CurrentCondition -eq $TerminatingCondition) # Why use the boring do-while?
```

To make a parameter out of a variable:

```powershell
param ($TerminatingCondition) # Any reasonable number of variables work here; just separate them with a comma each
```

To convert a script into a function:

```powershell
function New-MyFunction {
    # blah-blah, including the `param ()` block if you would like
}
```

To call the function:

```powershell
# Run the script by dot-sourcing it, so the function is loaded onto the session
. './path to/script.ps1'

# Call the function with the parameters, just as you would a cmdlet
New-MyFunction -TerminatingCondition 5
```

To create a script block instead of a function

```powershell
# Define the script block
$MyScriptBlock = {
    # blah-blah
}

# Call the script block using the calling operator
& $MyScriptBlock
```

To measure the running duration of a certain command, script or a function:

```powershell
Measure-Command New-MyFunction
```

## Important points to remember:

1. `*-Host` cmdlets send/receive content to/from the Information stream (and subsequently, the host). This stream does not interact with the pipeline.
2. Simply call the variable whose value you would like the function to return; there is no need to use the `return` keyword. However, make every function return only one kind of object because it affects how the output is used. Use `Get-Member` to see what object is output.
3. Name the functions like you would name cmdlets; use approved verbs.