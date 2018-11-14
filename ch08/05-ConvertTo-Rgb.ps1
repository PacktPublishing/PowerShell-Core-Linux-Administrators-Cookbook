$Rgb = Read-Host "Enter the hexadecimal RGB value"
$TrimmedRgb = $Rgb.Substring($Rgb.Length - 6)

$R = $TrimmedRgb.Substring(0, 2)
$G = $TrimmedRgb.Substring(2, 2)
$B = $TrimmedRgb.Substring(4, 2)

"Here are the R, G and B levels for the supplied hex value:"
$R, $G, $B | ForEach-Object { [int]("0x" + $PSItem) }