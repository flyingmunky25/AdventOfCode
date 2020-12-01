$input = Get-Content input.txt | %{[int]$_}

$foundPartOne = $false
$foundPartTwo = $false

for ($i = 0; $i -lt $input.Length; $i++)
{
    if ( $foundPartOne )
    {
        break
    }

    for ($j = 0; $j -lt $input.Length; $j++)
    {
        if ( $input[$i] + $input[$j] -eq 2020)
        {
            Write-Host "$($input[$i] * $input[$j])"
            $foundPartOne = $true
        }

        for ($k = 0; $k -lt $input.Length; $k++)
        {
            if ( $foundPartTwo )
            {
                break                
            }

            if ( ($input[$i] + $input[$j] + $input[$k]) -eq 2020)
            {
                Write-Host "$($($input[$i] * $input[$j] * $input[$k]))"
                $foundPartTwo = $true
                break
            }
        }
    }
}