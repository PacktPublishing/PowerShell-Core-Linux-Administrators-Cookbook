# Working with Strings

This cheatcheet is divided into two parts:

1. *Operators in PowerShell*, which is directly referred to in the chatpter.
2. *String operations in PowerShell*, which is, well, the usual cheatsheet.

## Operators in PowerShell

Enter the following at the prompt.

```powershell
(((2 * -5) / 10 + 16 ) % 4) - (-7)
```

Assign this to a variable that already contains a value. First, assign $Number a value of 25.

```powershell
$Number = 25

$Number += (((2 * -5) / 10 + 16 ) % 4) - (-7)

$Number
```

Increment $Number and show its value.

```powershell
$Number++

$Number
```

Perform a few comparisons.

```powershell
$Number -gt -5

$Number -ge 36

$Number -ne 36

'c' -gt 'k'
```

See if a certain string pattern matches another.

```powershell
'Frodo' -clike '?rod?'

'Frodo' -cmatch '^[^A-Z]'

'Frodo' -match 'frodo'
```

Try a few logical operators.

```powershell
$true -or $false

1 -and 0

1 -and 1
```

Split and join a few strings.

```powershell
'The quick brown fox jumps over the lazy dog' -split ' '
```

Join the resulting set of words using a comma and a space.

```powershell
('The quick brown fox jumps over the lazy dog' -split ' ') -join ', '
```

See if the resulting series of characters is a string.

```powershell
('The quick brown fox jumps over the lazy dog' -split ' ') -join ', ' -is [string]
```

Convert a double into an integer.

```powershell
2.21 -as [int]
```

Go back to the pangram we split into separate words. Assign the values to a variable, one after another.

```powershell
'The quick brown fox jumps over the lazy dog' -split ' ' | ForEach-Object { $Pangram += $PSItem }

$Pangram
```

That was not what we wanted. We want this to be an array of strings.

```powershell
Remove-Variable Pangram

$Pangram = @()

'The quick brown fox jumps over the lazy dog' -split ' ' | ForEach-Object { $Pangram += $PSItem }

$Pangram
```

Now, try the same thing with the comma operator.

```powershell
Remove-Variable $Pangram

'The quick brown fox jumps over the lazy dog' -split ' ' | ForEach-Object { $Pangram += , $PSItem }

$Pangram
```

Pick the eighth word from the array because it describes me.

```powershell
$Pangram[7]
```

Also:

```powershell
$Pangram -contains 'fox'
```

Recall Recipe 4.1: Working with date properties, wherein we showed the date in a proper format.

```powershell
"Six hours from now would be $((Get-Date).AddHours(6))."
```

Cast a date as a DateTime object and use the member access operator to call the ToShortDateString method.

```powershell
([datetime]'13 July 2018').ToShortDateString()
```

Finally, set the variable, $Numbers with values ranging from 91 to 100.

```powershell
$Numbers = 91..100

$Numbers
```

Oh, you thought that initialising a variable, splitting a pangram, and then using a loop to add the elements to the empty variable was an overkill, too? PowerShell isn't complicated; it is friendly. That longer path was to help you understand how strings and string arrays work. Here is an easier way to add the split elements to the array:

```powershell
Remove-Variable Pangram
$Pangram = 'The quick brown fox jumps over the lazy dog' -split ' '
```

## Different types of strings in PowerShell

To create a literal string:

```powershell
# Use single quotes
'This is a literal string'

# If the string contains a single quote
'I''m a literal string'

# Try a line break
'I''m a literal string`nI like showing up on the screen.'
```

To create an expanding string:

```powershell
# Expanding strings expand the variables within
"My home directory is $HOME"

# When a double quote appears within an expanding string
"Here is an ""expanding string"" with a double quote"

# Alternatively
"Here is an `"expanding string`" with a double quote"

# Try a line break; we know that escape characters work
"I'm an expanding string`nI like showing up on the screen."
```

Here Strings are strings that respect formatting.

```powershell
# A literal Here String
@'
Hello, there!

I am a Here String. PowerShell respects the way I look.

This Here String is the literal type. Therefore, $HOME appears as it is.
'@

# An expanding Here String
@"
Hello, there!

I am a Here String. PowerShell respects the way I look.

This Here String is the expanding type. Therefore, $HOME is expanded to its value.
"@
```

## String methods

These are methods within the `System.String` object.

Let us first look at trimming

```powershell
# Let us say we have a string assigned to a variable
$String = '.This is a string with a period on both the ends.'

# To trim a certain character in the beginning of a string
$String.TrimStart('.')

# To trim a certain character at the end of a string
$String.TrimEnd('.')

# To trim a certain character from the beginning and the end of the string
$String.Trim('.')
```

Next, work with string arrays. First, let us split the current string for use as an example.

```powershell
$String = $String.TrimStart('.')

# Split the string into an array
$String = $String.Split(' ')

# Now to get the fourth word from the sentence
$String[3]

# To get the index of a certain character
$String[3].IndexOf('i')

# To get a substring starting at 'i'
$String[3].Substring($String[3].IndexOf('i'))
```

There are some string functions to change the case of strings as well

```powershell
# To convert the case of the entire string to uppercase
$String[4].ToUpper()
```

String replacement works using string methods as well

```powershell
$String[4].Replace('i', 'o')
```

## String operations using operators

To see whether an array contains a certain element, use the `contains` operator.

```powershell
$String -contains 'string'
```

To see if a certain string contains a pattern:

```powershell
$String[6] -like '*io*'

# Alternatively
$String[6] -match 'io'
```

To replace a string using an operator instead of a string method:

```powershell
$String[4] -replace 'i', 'o'
```

To learn to leverage regex for more complex string matching operations, refer to the recipe, _Replacing substrings within strings_.

To combine a string, use the `join` operator:

```powershell
# Join all the words in the $String array using a space
$String = $String -join ' '
```

To split the string, use the `split` operator:

```powershell
# Split the sentence again at spaces
$String = $String -split ' '
```

## Formatting strings

You can use the formatting operator to format strings. Let us continue using the `$String` array.

```powershell
# To say 'This string contains a period', string and period being elements of the array
"This {0} contains a {1}." -f $String[3], $String[6]
```

To add a currency to the formatted output

```powershell
"{0:c}" -f 56
```

To format a number a certain way

```powershell
"{0:####-####-####-####}" -f 9089878728592950
```

To right-align an entire string array:

```powershell
"{0,6}`n{1,6}`n{2,6}`n{3,6}" -f $String
```