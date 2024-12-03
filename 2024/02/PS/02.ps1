# Compares values. Negative indicates "decreasing". Positive indicates "Increasing". 0 indicates "neither"
Function Get-Direction
{
    param ($value1, $value2)
    
    if ( $value1 -gt $value2)
    {
        return -1
    }
    
    if ($value1 -lt $value2)
    {
        return 1
    }
    return 0
}

Function Process-Report
{
    param($report)

    $directions = @()
    $differences = @()

    for ( $i = 0; $i -lt $report.Count - 1; $i++)
    {
        $directions += Get-Direction -value1 $report[$i] -value2 $report[$i + 1]
        $differences += [Math]::abs($report[$i] - $report[$i + 1])
    }

    $directionsSum = [Math]::Abs(($directions | Measure-Object -Sum).Sum)
    $differencesMaxMin = ($differences | Measure-Object -Maximum -Minimum)

    if ( $directionsSum -eq $report.Count - 1 -and $differencesMaxMin.Minimum -gt 0 -and $differencesMaxMin.Maximum -le 3)
    {
        return $true
    }

    return @{
        Differences      = $differences
        DifferenceMaxMin = $differencesMaxMin
        Directions       = $directions
        DirectionsSum    = $directionsSum
    }
}

$inputFile = Get-Content ..\input.txt

$safeReportsPartOne = New-Object System.Collections.ArrayList($null)
$safeReportsPartTwo = New-Object System.Collections.ArrayList($null)

foreach ( $item in $inputFile )
{
    [System.Collections.ArrayList]$report = $item.Split(' ') | ForEach-Object { Invoke-Expression [int]$_ }

    $reportResults = Process-Report -report $report

    if ($reportResults -eq $true)
    {
        $safeReportsPartOne.Add($report)
        $safeReportsPartTwo.Add($report)
    }
    else
    {
        $directions = $reportResults.Directions
        $directionsSum = $reportResults.DirectionsSum
        $differences = $reportResults.Differences
        $differencesMaxMin = $reportResults.DifferenceMaxMin

        $directionsGrouped = $directions | Group-Object
        $badDifferences = $differences | Where-Object {$_ -gt 3 -or $_ -le 0}

        # Check part two, the bad entries. Check if there's 1 bad direction, or if there's 1 single bad "difference (> 3 or < 1)
        if ( $directionsGrouped.Count -eq 2 -or $badDifferences.Count -eq 1)
        {
            $directionsGrouped = $directions | Group-Object -AsHashTable
            $badDirection = $directionsGrouped.GetEnumerator() | Where-Object { $_.Value.Count -eq 1 }

            # Do I have a bad direction?
            if ( $null -ne $badDirection)
            {
                $badDirection = $badDirection.value[0]
                # iterate over the directionsList and find the index of the bad one
                for ( $i = 0; $i -lt $directions.Count; $i++)
                {
                    # Check if it's matching the bad one
                    if ( $directions[$i] -eq $badDirection)
                    {
                        $report.RemoveAt($i)
                        
                        # Re-process with the removed item
                        $reportResults = Process-Report -report $report

                        if ($reportResults -eq $true)
                        {
                            $safeReportsPartTwo.Add($report)
                            break
                        }
                    }
                }
            }

            # Do I have a bad difference?
            elseif ( $badDifferences.count -eq 1)
            {
                for ( $i = 0; $i -lt $differences.Count - 1; $i++)
                {
                    if ( $differences[$i] -gt 3 -or $differences[$i] -le 0 )
                    {
                        $report.RemoveAt($i)

                        # Re-process with the removed item
                        $reportResults = Process-Report -report $report

                        if ($reportResults -eq $true)
                        {
                            $safeReportsPartTwo.Add($report)
                            break
                        }
                    }
                }
            }
        }
    }
}

Write-Output "Part One: $($safeReportsPartOne.Count)"
Write-Output "Part Two: $($safeReportsPartTwo.Count)"