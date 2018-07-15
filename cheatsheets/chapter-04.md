# First steps to administration using PowerShell

## Working with date and time

Custom formatting dates:

```PowerShell
$Date = Get-Date
"$($Date.Day)/$($Date.Month)/$($Date.Year)"
```

Pre-formatted dates (some examples):

```PowerShell
Get-Date -Format d
Get-Date -Format g
Get-Date -Format U
Get-Date -Format yyyy/MM/dd
Get-Date -Format yyyyMMddhhmmss
```

UNIX-like date formatting:

```PowerShell
Get-Date -Uformat %d/%m/%Y
```

Find what day of week a certain date is:

```PowerShell
# Avoiding all confusion
(Get-Date -Day 31 -Month 10 -Year 2018).DayOfWeek

# If your locale is the only context your scripts would run in
(Get-Date 31/10/2018).DayOfWeek

# Using a type accelerator
([datetime]'10/31/2018').DayOfWeek

# Using a type accelerator, avoiding ambiguity
([datetime]'31 October 2018').DayOfWeek
```

Convert time into UTC:

```PowerShell
(Get-Date).ToUniversalTime()
```

Calculating time:

```PowerShell
# Add days to the current date
(Get-Date).AddDays(35)

# Subtract days from the current date
(Get-Date).AddDays(-21)

# Add hours and minutes
(Get-Date).AddHours(3).AddMinutes(18)

# Time between two dates
(Get-Date).Subtract((Get-Date '5 June 2016'))
```

## Working with processes

Working with currently running processes:

```PowerShell
# Listing out the processes
Get-Process

# Counting the processes
(Get-Process).Count
```

Getting the average of memory pages used:

```PowerShell
Get-Process | Measure-Object -Property WS -Average
```

Getting more working set information:

```PowerShell
Get-Process | Measure-Object -Property WS -Average -Sum -Minimum -
Maximum
```

Getting more than one such properties from the process table:

```PowerShell
Get-Process | Measure-Object -Property WS, CPU -Average -Sum -Minimum -
Maximum
```

Getting the owner of processes:

```PowerShell
Get-Process -IncludeUserName
```

Listing the processes owned by you:

```PowerShell
# Listing the processes
Get-Process -IncludeUserName | grep $env:USERNAME

# Counting the processes
(Get-Process -IncludeUserName | grep $env:USERNAME).Count

# Alternatively,
Get-Process -IncludeUserName | grep $env:USERNAME | Measure-Object
```

Bonus: Measuring the working set consumed by the processes owned by you (combination of PowerShell and Linux commands):

```PowerShell
Get-Process -IncludeUserName | grep ram | awk '{print $1}' | ForEachObject
{[Double]$_} | Measure-Object -Sum
```

## Scheduling jobs

Creating a job that runs every fifteen minutes:

```PowerShell
# Explicit configuration
New-CronJob -Command 'pwsh -f "/tmp/DataLoading.PS1;"' -Minute
0,15,30,45 | Out-Host

# Using interval notation
New-CronJob -Command 'pwsh -f "/tmp/DataLoading.PS1;"' -Minute */15 |
Out-Host

# Specifying a time range
New-CronJob -Command 'pwsh -f "/tmp/DataLoading.PS1;"' -Minute */15 -Hour 10-12 | Out-Host

# With days of week and months of the year
New-CronJob -Command 'pwsh -f "/tmp/DataLoading.PS1;"' -Minute */15 -
Hour 10-12 -DayOfWeek sun, tue, fri -Month Jan, Mar, Jun, Sep, Dec | Out-Host
```

Listing out scheduled jobs:

```PowerShell
Get-CronJob

# If you want better formatting:
Get-CronJob | Format-Table -Autosize
```

Get the contents of the `crontab` file:

```PowerShell
Get-CronTab
```

Removing jobs:

```PowerShell
Get-CronJob | Where-Object {$_.Month -match 'Jan'} | Remove-CronJob
```
