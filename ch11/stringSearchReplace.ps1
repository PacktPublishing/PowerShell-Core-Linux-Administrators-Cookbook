$content = Get-Content names.txt
$content
$content -replace '(.*) (.*)','$2, $1'

