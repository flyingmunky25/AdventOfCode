
Function Part-One
{
    $total = 0

    foreach ($val in $script:input)
    {
        $op = $val.Substring(0,1)
        $num = $val.Substring(1)
        
        switch ($op)
        {
            '+' { $total = $total + $num }
            '-' { $total = $total - $num }
        }
    }
    Write-Host $total
}

Function Part-Two
{
    $freq = @()
    $curFreq = 0

    $found = $false
    while (!$found)
    {
        foreach ( $val in $script:input)
        {
            $curFreq+= $val

            if ( $freq.Contains($curFreq))
            {
                $found = $true
                break
            }
            else {
                $freq += $curFreq    
            }
        }
    }
    Write-Host $curFreq
}
$script:input = Get-Content input.txt
Part-One
Part-Two