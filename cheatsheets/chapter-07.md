# Flow Control using Branches and Loops

Branching and looping are perhaps at the heart of any kind of logical flow.

## Branching

The most basic kind of branching is the `if` statement:

```powershell
$Today = Get-Date

if ($Today.DayOfWeek -eq 'Sunday') {
    "Don't disturb me."
}
```

If you have two conditions and they are mutually exclusive:

```powershell
$Today = Get-Date

if ($Today.DayOfWeek -eq 'Sunday') {
    "Don't disturb me."
}
else {
    "I'm available."
}
```

If you have more conditions:

```powershell
$Today = Get-Date

if ($Today.DayOfWeek -eq 'Sunday') {
    "Don't disturb me."
}
elseif ($Today.DayOfWeek -eq 'Saturday') {
    "I'm available for parties."
}
else {
    "I'm available to work."
}
```

If you have more (and specific conditions), use the switch–case statement:

```powershell
$Today = (Get-Date).DayOfWeek

switch ($Today) {
    'Saturday' {
        "I'm available for parties."
    }
    'Sunday' {
        "Don't disturb me."
    }
}
```

If you need a catch-all:

```powershell
$Today = (Get-Date).DayOfWeek

switch ($Today) {
    'Saturday' {
        "I'm available for parties."
    }
    'Sunday' {
        "Don't disturb me."
    }
    Default {
        "I'm available to work."
    }
}
```

If you would like wildcard matching:

```powershell
$Today = (Get-Date).DayOfWeek

switch -wildcard ($Today) {
    'S*day' {
        "Weekend!"
    }
    Default {
        "Weekday."
    }
}
```

## Looping

There are six looping constructs in PowerShell.

The first one is a cmdlet, that works through the pipeline:

```powershell
$String = 'This is a string with a period.' -split ' '

$String | Foreach-Object {$PSItem.ToUpper()} # Of course, you can do $String.ToUpper(), but play along.
```

Next, when you don't want to use the pipeline, but have a finite set of objects as an array:

```powershell
$String = 'This is a string with a period.' -split ' '

foreach ($Element in $String) {
    $Element.ToUpper()
}
```

Now to the looping constructs most of us are familiar with from other languages:

First is the For loop.

```powershell
for ($i = 0; $i -lt 10; $i++) {
    $i
}
```

If you want a while construct:

```powershell
$i = 0
while ($i -lt 10) {
    $i
    $i++
}
```

If you want the loop to execute once regardless of whether the condition is met:

```powershell
$i = 11
do {
    $i
    $i++
} while ($i -lt 10)
"The current value of i after the loop is $i"
```

That loop exited when the condition became false. If you would like the loop to exit when the condition became true (and execute it once regardless of whether the outcome of the condition is true or false):

```powershell
$i = 11
do {
    $i
    $i++
} until ($i -gt 10)
"The current value of i after the loop is $i"
```