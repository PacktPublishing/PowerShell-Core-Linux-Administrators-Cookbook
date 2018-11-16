$Names = Get-Content .\ch09\02-names.txt
$NewNames = @()

foreach ($Name in $Names) {
    $Name = $Name -split ' '
    $NewName = $Name[1], $Name[0] -join ', '

    $NewNames += $NewName
}
if ($NewNames -contains 'Torres,*') {
    Write-Host "Found Leon Torres in the list!"
}