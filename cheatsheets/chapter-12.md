# Advanced Concepts of Functions

To set a parameter as positional and mandatory (0 stands for position 1):

```powershell
param (
    [Parameter(Mandatory=$true, Position=0)]
    [datatype]
    $MyParameter
)
```

To assign a default value to a parameter:

```powershell
param (
    [Parameter(Mandatory=$false)]
    [datatype]
    $MyParameter = 21
)
```

To set a parameter alias for a parameter:

```powershell
param (
    [Parameter(Mandatory=$true, Position=0)]
    [Alias("mp")]
    [datatype]
    $MyParameter
)
```

To create a parameter set:

```powershell
[CmdletBinding(DefaultParameterSetName='First')]
param (
    # To make a parameter part of multiple parameter sets
    [Parameter(Mandatory=$true, Position=0, ParameterSetName='First')]
    [Parameter(Mandatory=$true, Position=0, ParameterSetName='Second')]
    [string]
    $ParamCommon,

    [Parameter(Mandatory=$true, Position=1, ParameterSetName='First')]
    [string]
    $ParamOne,

    [Parameter(Mandatory=$true, Position=1,
    ParameterSetName='Second')]
    [string]
    $ParamTwo
)
```

To add parameter validation:

```powershell
param (
    [Parameter(Mandatory=$false, Position=0)]
    [ValidateSet(5, 10, 15, 20)]
    [int]
    $MyParameter
)
```

To add a simple dependency to a function, use the `begin` block:

```powershell
function New-MyFunction {
    param (
        $MyParameter
    )
    begin {
        # Call the dependencies here
    }
    # Main function body
}
```

Alternatively, use a `process` and an `end`:

```powershell
function New-MyFunction {
    param (
        $MyParameter
    )
    begin {
        # Dependencies
    }
    process {
        # Main function body
    }
    end {
        # Cleanup
    }
}
```

To break out of the function itself if a dependency fails:

```powershell
begin {
    try {
        # Load dependency with -ErrorAction Stop
    }
    catch {
        break
    }
}
```

To add a confirmation prompt and `WhatIf` in a function:

```powershell
function New-MyFunction {
    [CmdletBinding(ConfirmImpact = 'High', SupportsShouldProcess=$true)]
    param (
        # Your parameter block
    )
    process {
        if ($PsCmdlet.ShouldProcess("Item on which the operation is performed", "Action that would be performed")) {
            # Perform the action
        }
    }
}
```

To add help to functions, use the command-based help syntax.

```powershell
function New-MyFunction {
    <#
    .SYNOPSIS
    # A short summary of what your function does.

    .DESCRIPTION
    Describe what the function does.

    .PARAMETER ParameterOne
    Helpful information about the parameter.

    .PARAMETER ParameterTwo
    Helpful information about the parameter.

    .EXAMPLE
    New-MyFunction -ParameterOne 'Value'

    .NOTES
    Any additional notes about the function (even attribution)
    #>
}
```

**Tip**: Start a comment block right above the function declaration to get the fields populated automatically.

To add support for pipeline input:

```powershell
function New-MyFunction {
    param (
        # The path to the file (or the name)
        [Parameter(ValueFromPipeline)]
        [string[]]
        $MyParameter
    )
}
```

The following kinds of pipeline input are allowed:

- Accept input by type
    - With coercion
    - Without coercion
- Accept input by parameter name
    - With coercion
    - Without coercion

If your script contains several functions, which are already being called in a certain order from within each other, but you would like to improve readability, use the `Main` function:

```powershell
function Main {
    New-MyFunctionThree
}

function New-MyFunction {
    # Some tasks
}

function New-MyFunctionTwo {
    New-MyFunction
}

function New-MyFunctionThree {
    New-MyFunctionTwo
}

Main
```

If you are writing a script module, and would only like to expose a single function to the user:

```powershell
function New-MyFunction {
    # Some tasks
}

function New-MyFunctionTwo {
    New-MyFunction
}

function New-MyFunctionThree {
    New-MyFunctionTwo
}

Export-ModuleMember New-MyFunctionThree
```

To do something when a certain module is called using `Remove-Module` (such as cleanup), add the following to the end of the module file:

```powershell
$MyInvocation.MyCommand.ScriptBlock.Module.OnRemove = {
    # Anything you would like done as part of module removal
}
```

If you would like to ensure that the aforementioned steps be taken even if the PowerShell session is closed, append the file with the content below:

```powershell
Register-EngineEvent PowerShell.Exiting {
    # Your cleanup steps here
}
```