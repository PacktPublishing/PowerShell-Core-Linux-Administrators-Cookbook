# Performing Calculations

Calculations in PowerShell are rather simple.

## Arithmetic operations

The basic math:

```powershell
5 + 25 / 5 * 21 % (10 - 5)
```

Using math accelerators:

```powershell
# To get the square of a number
[math]::Pow(5, 2)

# To get the square root of a number
[math]::Sqrt(25)

# The floor and the ceiling functions
[math]::Ceiling(32.223)
[math]::Floor(32.223)

# To round off a number to the nearest hundredth
[math]::Round(32.223, 2)
```

There are administrative constants in PowerShell that help you convert numbers:

```powershell
# To convert bytes into MB
1099511627776/1MB

# To convert bytes into GB
1099511627776/1GB

# To convert bytes into TB
1099511627776/1TB

# To get multiples of 10
8 * 1e3
```

Type conversion is also simple in PowerShell:

```powershell
# To convert hexadecimal into integer
[int]("0x222")

# To convert an integer into an Octal number
[Convert]::ToString('565', 8)

# To convert an integer into a hexadecimal number
[Convert]::ToString('565', 16)

# To convert an integer into a binary number
[Convert]::ToString('565', 2)
```