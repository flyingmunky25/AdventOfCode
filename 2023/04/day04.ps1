$inputFile = Get-Content .\myInput.txt

$runningTotal = @()
foreach ( $game in $inputFile )
{
    $total = 0
    $gameID = [int]((Select-String -InputObject $game -Pattern "Card\s+\d+" -AllMatches).Matches -replace 'Card|:|\s')[0]
    Write-Host $gameID

    $values = ($game -split ': ')[1]
    $myNumbers = [int[]](($values -split ' \| ')[1] -replace '\s+',',' -split ',') | Sort-Object
    $winningNumbers = [int[]](($values -split ' \| ')[0] -replace '\s+',',' -split ',') | Sort-Object

    $myMatches = $myNumbers | Where-Object {$_ -in $winningNumbers } | Measure-Object | Select-Object -ExpandProperty Count
    Write-Host "-- Winning #:  $($winningNumbers -join ',')"
    Write-Host "-- My #: $($myNumbers -join ',')"
    Write-Host "-- Matches: $($myMatches -join ',')"

    if ($myMatches -gt 0)
    {
        $total = 1 * [Math]::Pow(2,$myMatches-1)
    }
    
    $runningTotal += $total
    write-host "---- $total card points"
    write-host "Running Total: $(($runningTotal | Measure-Object -Sum).Sum)"
    Write-Host
}

Write-Host "Part One: $(($runningTotal | Measure-Object -Sum).Sum)"