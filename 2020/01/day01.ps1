$input = Get-Content input.txt

for ($i = 0; $i -lt $input.Length; $i++)
{
    for ($j = 0; $j -lt $input.Length; $j++)
    {
        $curSum = $input[$i] + $input[$j]
        if ( $curSum -eq 2020)
        {
            Write-Host "$($input[$i] * $input[$j])"
        }
    }
}