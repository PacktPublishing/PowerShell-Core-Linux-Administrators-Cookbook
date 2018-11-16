$Names = Get-Content .\ch09\02-names.txt
$Names = $Names -match 'son$'

# or $Names = $Names -like '*son'

$NewNames = @()

foreach ($Name in $Names) {
    $Name = $Name -split ' '
    $NewName = $Name[1], $Name[0] -join ', '

    $NewNames += $NewName
}
$NewNames