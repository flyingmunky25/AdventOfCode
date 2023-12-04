$inputFile = Get-Content .\sampleInput.txt
$symbols = '[^a-zA-Z0-9\.]'
$lineLength = $inputFile[0].Length
$symbolIndexes = @{
    periods       = @()
    symbols       = @()
    indexesToSkip = $symbolIndexes.periods + $symbolIndexes.symbols
}
$inputArray = @()

$inputArray = $inputFile -split '`\r`\n'

$charCount = 0

# Get the indexes of all symbols
foreach ($line in $inputFile)
{
    for ( $i = 0; $i -lt $lineLength; $i++ )
    {
        if ( $line[$i] -match $symbols)
        {
            $symbolIndexes.symbols += $charCount
        }
        elseif ( $line[$i] -eq '.')
        {
            $symbolIndexes.periods += $charCount
        }
        $charCount++
    }
}

# Reset this back to zero and keep count of where we are
$charCount = 0

for ( $i = 0; $i -lt $inputArray.Count; $i++)
{
    $line = $inputArray[$i] -split ''
    
    for ( $j = 0; $j -le $line.Count; $j++ )
    {
        # Are you a symbol or a period?
        if ($charCount -in $symbolIndexes.indexesToSkip)
        {
            #just increment the counter and carry on
            $charCount++
            continue;
        }
        
        # I was digit
        # Look and see if there's more digits after me
        $curDigits = $inputArray[$i][$j]
        $numSpacesToAdvance = 0
        for ( $k = $j+1; $k -le $lineLength - $j; $k++)
        {
            if ( $inputArray[$i][$k] -match '[0-9]')
            {
                $curDigits += $inputArray[$i][$k]
                $numSpacesToAdvance++
            }
            else {
                break;
            }
        }

        $j += $numSpacesToAdvance
        $charCount += $numSpacesToAdvance + 1
    }
}

write-host "temp"