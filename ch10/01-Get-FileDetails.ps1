Write-Host "File details:"

Get-Item ./01-random-text.txt

"Here are the first seven lines from the file."

Get-Content ./01-random-text.txt -ReadCount 7 | Select-Object -First 1

"Here are the last five lines from the file."

Get-Content ./01-random-text.txt -Tail 5

"Here are the eleventh to the thirteenth lines."

Get-Content ./01-random-text.txt | Select-Object -First 3 -Skip 10

"And here are some details about the content in the file."

Get-Content ./01-random-text.txt | Measure-Object -Character -Word -Line

"Finally, the content will be imported into a variable. Let us see if the content is a single block of text or not."

$Content = Get-Content ./01-random-text.txt

"There are $($Content.Count) elements in the variable."

"When read as raw content, the number of elements is $((Get-Content ./01-random-text.txt -Raw).Count)"