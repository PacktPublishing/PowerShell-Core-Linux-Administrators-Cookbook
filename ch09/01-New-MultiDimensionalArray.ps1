$MultiDimensionalArray = New-Object -TypeName "int[,]" 4, 5
$Count = 1

for ([int]$i = 0; $i -lt 4; $i++) {
    for ([int]$j = 0; $j -lt 5; $j++) {
        $MultiDimensionalArray[$i,$j] = $Count
        $Count++
    }
}