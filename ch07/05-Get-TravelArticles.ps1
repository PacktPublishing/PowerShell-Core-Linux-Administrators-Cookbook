$CsvImport = Import-Csv ./05-sitelist.csv
if ($CsvImport.Name -contains 'BBC') {
    $Uri = ($CsvImport | Where-Object Name -EQ 'BBC').HomeURL
    (Invoke-WebRequest -Uri $Uri).Links |
    Where-Object href -match '/travel/.+' |
    Select-Object -ExpandProperty href -Unique
}
Remove-Item ./05-sitelist.csv