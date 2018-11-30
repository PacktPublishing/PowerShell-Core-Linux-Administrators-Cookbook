# Using Arrays and Hashtables

Remember them like this: Arrays are collections of elements; use indices to address them. Hashtables are arrays that use names to address the elements.

## Arrays

There are two ways to create an array:

```powershell
# First, by initializing an array and adding contents
$Array = @()

$Array += 'First element'
$Array += 'Second element'

# Second, using the comma operator
$Array = , 'First element' + 'Second element'
```

To combine arrays, simply add them:

```powershell
$ArrayOne = , 'First element' + 'Second element'
$ArrayTwo = , 'Third element' + 'Fourth element'

$ArrayOne + $ArrayTwo
```

To create a jagged array:

```powershell
$JaggedArray = @(
    (1, 2, 3, 4, 5),
    (6, 7, 8),
    (9, 10, 11, 12, 13, 14),
    (15, 16, 17, 18),
    (19, 20)
)
```

To create a non-jagged array:

```powershell
$MultiDimensionalArray = New-Object -TypeName "int[,]" 4, 5
$Count = 1
for ([int]$i = 0; $i -lt 4; $i++) {
    for ([int]$j = 0; $j -lt 5; $j++) {
        $MultiDimensionalArray[$i,$j] = $Count
        $Count++
    }
}

# Access a random member from within the array:
$MultiDimensionalArray[2,3]
```

To access an element from the array, use the index:

```powershell
$Array = , 'First element' + 'Second element'

$Array[1]
```

To see if an array contains an element:

```powershell
$Array -contains 'Second element'
```

To match patterns in an array:

```powershell
$Array -match 'element'

$Array -match 'First'
```

To remove an element from an array:

```powershell
# Create a new object of type System.Collections.ArrayList
$NewArray = New-Object -TypeName System.Collections.ArrayList

# Use the Add() method of the object to add elements
$NewArray.Add('First element')
$NewArray.Add('Second element')
$NewArray.Add('Third element')

# To remove an element from the array, use the Remove() method from within the object
$NewArray.Remove('Second element')
```

The other way of removing objects from an array is to filter unwanted elements using `Where-Object` and then, assigning those values to a new variable.

To compare two arrays, use the `Compare-Object` cmdlet.

```powershell
$ArrayOne = , 'First element' + 'Second element' + 'Third element'
$ArrayTwo = , 'Third element' + 'Fourth element' + 'Fifth element'

Compare-Object -ReferenceObject $ArrayOne -DifferenceObject $ArrayTwo
```

## Hashtables

To initialize a hashtable:

```powershell
$MyHashtable = @{} # As opposed to @() for arrays
```

To add elements to a hashtable:

```powershell
$MyHashtable['FirstElement'] = 1
$MyHashtable['SecondElement'] = 2
```

To access the elements in a hashtable:

```powershell
$MyHashtable['SecondElement']
```

To see if the hashtable contains a certain element (find by name):

```powershell
$MyHashtable.Contains['FirstElement']
```

To remove an element from a hashtable:

```powershell
$MyHashtable.Remove['SecondElement']
```

You can also use a method to add elements to a hashtable:

```powershell
$MyHashtable.Add('ThirdElement', 3)
```

To sort a hashtable:

```powershell
# Based on the names
$MyHashtable.GetEnumerator() | Sort-Object Name

# Based on the values
$MyHashtable.GetEnumerator() | Sort-Object Value
```