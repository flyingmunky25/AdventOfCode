Measure-Command -Expression {
$pairs = get-content .\input.txt | ConvertFrom-Csv
$list1 = $pairs.list1 | Sort-Object
$list2 = $pairs.list2 | Sort-Object
$list2Grouped = $list2 | Group-Object -AsHashTable

$diffList = @()
$similarities = @()
for ( $i = 0; $i -lt $list1.Count; $i++)
{
    # Determine part one, the difference between the numbers
    $diffList += [Math]::Abs(($list1[$i] - $list2[$i]))
    
    # Determine part two, the similaries/occurrances of list1 items in list 2
    $similarities += [int]([int]$list1[$i] * ($list2Grouped["$($list1[$i])"]).Count)
}

Write-Output "Part One: $(($diffList | Measure-Object -Sum).Sum); Part Two: $(($similarities | Measure-Object -Sum).Sum)"
}