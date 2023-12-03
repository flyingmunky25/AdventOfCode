$inputFile = Get-Content .\sampleInput.txt
$symbols = @('!@#$%^&*()_-=+/,<>[]\{}|`~')

$inputArray = @()
$2Darray = @()

$inputArray = $inputFile -split '`\r`\n'

for ( $i = 0; $i -lt $inputArray.Count; $i++)
{
    $line = $inputArray[$i] -split ''
    
    for ( $j = 0; $j -le $line.Count; $j++ )
    {
        # am I a period, symbol
    }
}

write-host "temp"