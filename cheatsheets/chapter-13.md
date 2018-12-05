# Debugging and Error Handling

To enable debugging on a script, either:

1. Set the `DebugPreference` to `Continue`, or
2. Add (even an empty) `[CmdletBinding()]` line to the beginning of the function

Run the function with the `-Debug` switch to get debug information displayed on the host.

```powershell
New-MyFunction -MyParameter 'Value' -Debug
```

If you would like to step through each line in the function as part of debugging:

```powershell
# Set debugging on
Set-PsDebug -Step

# Call your function
New-MyFunction -MyParameter 'Value'

# Exit the debug mode using the -Off switch
Set-PsDebug -Off
```

To get into the trace mode for degugging, use the `-Trace` switch.

```powershell
Set-PsDebug -Trace 1 # or 2
```

To set a breakpoint:

```powershell
Set-PsBreakpoint -Script ./path/to/script.ps1 -Line 5
```

To list out all the breakpoints or remove the breakpoints:

```powershell
# List breakpoints
Get-PsBreakpoint

# Remove breakpoints
Remove-PsBreakpoint -Id 1 # as in the relevant ID as per Get-PsBreakpoint
```

To set a conditional breakpoint (breakpoint that works if a certain condition is met):

```powershell
# First, set the condition
$Condition = { if ($Count -lt 2 <# Or any other relevant condition #>) { break } }

# Now, set the breakpoint on the script
Set-PsBreakpoint ./path/to/script.ps1 -Line 5 -Action $Condition
```

To see if there was an error in the previous statement (within a script):

```powershell
$?
# Returns a Boolean output; TRUE means 'successfully executed'
```

If a native command was run and the command exited in an error, the error is recorded in the automatic variable, `$LASTEXITCODE`.

To hide errors at the terminal, (but continue to record them), use either:

```powershell
# The common switch parameter
New-MyFunction -ErrorAction SilentlyContinue

# Or set the error action preference (use carefully; not recommended unless you know what you're doing)
Set-Variable ErrorActionPreference 'SilentlyContinue'

# Alternatively
$ErrorActionPreference = 'SilentlyContinue'
```

To list out all the errors encountered in the current session (unless the error variable was cleared)

```powershell
$Error
```

Treat this variable like a LIFO array, meaning, `$Error[0]` is the last error that was encountered. There are several properties in the variable.

To clear the error variable, use the `Clear()` method baked into it:

```powershell
$Error.Clear()
```

To control flow based on errors, use the `try`-`catch`-`finally` construct:

```powershell
try {
    # Some action here, with `-ErrorAction Stop` to make it terminating
}
catch [System.IO.DirectoryNotFoundException] <# Or any exception name as shown by the `Exception:` line of the error #> {
    # Actions to take in case of this exception
}
catch {
    # Catch-all statment: In case of any exception other than the above
}
finally {
    # The `finally` actions
}
```