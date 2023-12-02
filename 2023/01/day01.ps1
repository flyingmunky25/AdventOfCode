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
    $digitsPartOne = Select-String '\d{1}' -InputObject $line -AllMatches
    if ( $digitsPartOne.Count -gt 0)
    {
        $partOneNum = [int]($digitsPartOne.Matches[0].value + $digitsPartOne.Matches[$digitsPartOne.Matches.Count - 1].value)
        $partOneTotal += $partOneNum
    }

    # Collect the values for part 2
    $tmpLine = $line
    foreach ( $value in $wordToDigitMap.GetEnumerator())
    {
        $tmpLine = $tmpLine -replace $value.Key, $value.Value
    }

    $digitsPartTwo = Select-String '\d{1}' -InputObject $tmpLine -AllMatches
    $partTwoNum = [int]($digitsPartTwo.Matches[0].value + $digitsPartTwo.Matches[$digitsPartTwo.Matches.Count - 1].value)
    $partTwoTotal += $partTwoNum
}

Write-Host "Part One: $partOneTotal"
Write-Host "Part Two: $partTwoTotal"