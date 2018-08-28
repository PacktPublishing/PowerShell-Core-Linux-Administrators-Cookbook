$Names = Get-Content .\02-names.txt
$NewNames = @()

foreach ($Name in $Names) {
    $Name = $Name -split ' '
    $NewName = $Name[1], $Name[0] -join ', '

    $NewNames += $NewName
}
$NewNames