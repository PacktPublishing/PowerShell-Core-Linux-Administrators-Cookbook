$ListOne = Get-Content ./05-list-one.txt
$ListTwo = Get-Content ./05-list-two.txt

"List one contains $($ListOne.Count) items."
"List two contains $($ListTwo.Count) items."

$CombinedList = $ListOne + $ListTwo

$CombinedList