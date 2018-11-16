$Names = Get-Content .\ch09\02-names.txt
$NewNames = @()

foreach ($Name in $Names) {
    $Name = $Name -split ' '
    $NewName = $Name[1], $Name[0] -join ', '

    $NewNames += $NewName
}
"Using the match operator:"
$NewNames -match 'son,'

"Using the like operator:"
$NewNames -like '*son,*'