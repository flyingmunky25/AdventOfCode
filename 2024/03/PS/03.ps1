#
# Wrong attempts:
# Part Two: 70776740 (too low)
# Correct answers: Part one: 157621318; Part Two: 79845780
#
$entries = Select-String -Path ..\input.txt -AllMatches -Pattern "(mul\(\d+,\d+\))|(do(n't)?\(\))" | ForEach-Object { $_.Matches.Value }

$partOne, $partTwo = @()

$shouldProcess = $true

foreach ( $entry in $entries)
{
    if ( $entry -eq 'do()' )
    {
        $shouldProcess = $true
    }
    elseif ( $entry -eq "don't()")
    {
        $shouldProcess = $false
    }
    else
    {
        $digits = ((Select-String -InputObject $entry -AllMatches -Pattern "mul\(\d+,\d+\)") | ForEach-Object { ($_.Matches.Value -replace 'mul|\(|\)') }).Split(',')
        $product = [int]$digits[0] * [int]$digits[1]

        $partOne += $product
        if ( $shouldProcess )
        {
            $partTwo += $product
        }
    }
}

Write-Host "Part One: $(($partOne | Measure-Object -Sum).Sum)"
Write-Host "Part Two: $(($partTwo | Measure-Object -Sum).Sum)"