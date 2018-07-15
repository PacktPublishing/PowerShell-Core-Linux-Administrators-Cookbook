# Working with Strings

This cheatcheet is divided into two parts:

1. *Operators in PowerShell*, which is directly referred to in the chatpter.
2. *String operations in PowerShell*, which is, well, the usual cheatsheet.

## Operators in PowerShell

Enter the following at the prompt.

```powershell
PS> (((2 * -5) / 10 + 16 ) % 4) - (-7)
```

Assign this to a variable that already contains a value. First, assign $Number a value of 25.

```powershell
PS> $Number = 25

PS> $Number += (((2 * -5) / 10 + 16 ) % 4) - (-7)

PS> $Number
```

Increment $Number and show its value.

```powershell
PS> $Number++

PS> $Number
```

Perform a few comparisons.

```powershell
PS> $Number -gt -5

PS> $Number -ge 36

PS> $Number -ne 36

PS> 'c' -gt 'k'
```

See if a certain string pattern matches another.

```powershell
PS> 'Frodo' -clike '?rod?'

PS> 'Frodo' -cmatch '^[^A-Z]'

PS> 'Frodo' -match 'frodo'
```

Try a few logical operators.

```powershell
PS> $true -or $false

PS> 1 -and 0

PS> 1 -and 1
```

Split and join a few strings.

```powershell
PS> 'The quick brown fox jumps over the lazy dog' -split ' '
```

Join the resulting set of words using a comma and a space.

```powershell
PS> ('The quick brown fox jumps over the lazy dog' -split ' ') -join ', '
```

See if the resulting series of characters is a string.

```powershell
PS> ('The quick brown fox jumps over the lazy dog' -split ' ') -join ', ' -is [string]
```

Convert a double into an integer.

```powershell
PS> 2.21 -as [int]
```

Go back to the pangram we split into separate words. Assign the values to a variable, one after another.

```powershell
PS> 'The quick brown fox jumps over the lazy dog' -split ' ' | ForEach-Object { $Pangram += $PSItem }

PS> $Pangram
```

That was not what we wanted. We want this to be an array of strings.

```powershell
PS> Remove-Variable Pangram

PS> $Pangram = @()

PS> 'The quick brown fox jumps over the lazy dog' -split ' ' | ForEach-Object { $Pangram += $PSItem }

PS> $Pangram
```

Now, try the same thing with the comma operator.

```powershell
PS> Remove-Variable $Pangram

PS> 'The quick brown fox jumps over the lazy dog' -split ' ' | ForEach-Object { $Pangram += , $PSItem }

PS> $Pangram
```

Pick the eighth word from the array because it describes me.

```powershell
PS> $Pangram[7]
```

Also:

```powershell
PS> $Pangram -contains 'fox'
```

Recall Recipe 4.1: Working with date properties, wherein we showed the date in a proper format.

```powershell
PS> "Six hours from now would be $((Get-Date).AddHours(6))."
```

Cast a date as a DateTime object and use the member access operator to call the ToShortDateString method.

```powershell
PS> ([datetime]'13 July 2018').ToShortDateString()
```

Finally, set the variable, $Numbers with values ranging from 91 to 100.

```powershell
PS> $Numbers = 91..100

PS> $Numbers
```

Oh, you thought that initialising a variable, splitting a pangram, and then using a loop to add the elements to the empty variable was an overkill, too? PowerShell isn't complicated; it is friendly. That longer path was to help you understand how strings and string arrays work. Here is an easier way to add the split elements to the array:

```powershell
PS> Remove-Variable Pangram
PS> $Pangram = 'The quick brown fox jumps over the lazy dog' -split ' '
```

## String operations in PowerShell