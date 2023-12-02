$inputFile = Get-Content .\myInput.txt
$wordToDigitMap = @{
    "one"   = "o1e"
    "two"   = "t2o"
    "three" = "t3e"
    "four"  = "f4r"
    "five"  = "f5e"
    "six"   = "s6x"
    "seven" = "s7n"
    "eight" = "e8t"
    "nine"  = "n9e"
}

$partOneTotal = 0
$partTwoTotal = 0

foreach ( $line in $inputFile )
{
    # Collect the values to part 1
    $digitsPartOne = (Select-String '\d{1}' -InputObject $line -AllMatches).Matches
    if ( $digitsPartOne.Count -gt 0)
    {
        $partOneTotal += [int]($digitsPartOne[0].value + $digitsPartOne[$digitsPartOne.Count - 1].value)
    }

    # Collect the values for part 2
    $partTwoLine = $line
    $wordToDigitMap.GetEnumerator() | ForEach-Object {$partTwoLine = $partTwoLine -replace $_.Key, $_.Value}

    $digitsPartTwo = (Select-String '\d{1}' -InputObject $partTwoLine -AllMatches).Matches
    $partTwoTotal += [int]($digitsPartTwo[0].value + $digitsPartTwo[$digitsPartTwo.Count - 1].value)
}

Write-Host "Part One: $partOneTotal"
Write-Host "Part Two: $partTwoTotal"