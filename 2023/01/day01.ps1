$inputFile = Get-Content .\myinput.txt
$ErrorActionPreference = "Stop"
$wordToDigitMap = @{
    "one"   = 1
    "two"   = 2
    "three" = 3
    "four"  = 4
    "five"  = 5
    "six"   = 6
    "seven" = 7
    "eight" = 8
    "nine"  = 9
}

$runningTotal = 0

foreach ( $line in $inputFile )
{
    $digits = Select-String '\d{1}' -InputObject $line -AllMatches
    
    $compiledNum = [int]($digits.Matches[0].value + $digits.Matches[$digits.Matches.length - 1].value)

    $runningTotal += $compiledNum
}

Write-Host "Part One: $runningTotal"