$gameInput = Get-Content ./myInput.txt

$colorMax = @{red = 12; green = 13; blue = 14}
$validGames = @()
$powerSetValues = @()

foreach ( $game in $gameInput )
{
    $gameID = [int]((Select-String -InputObject $game -Pattern "Game \d+" -AllMatches).Matches -replace 'Game|:')[0]
    $blues = (Select-String -InputObject $game -Pattern '\d{1,2} Blue' -AllMatches).Matches -replace ' Blue' | Measure-Object -Maximum
    $greens = (Select-String -InputObject $game -Pattern '\d{1,2} Green' -AllMatches).Matches -replace ' Green' | Measure-Object -Maximum
    $reds = (Select-String -InputObject $game -Pattern '\d{1,2} Red' -AllMatches).Matches -replace ' Red' | Measure-Object -Maximum

    if ( $blues.Maximum -le $colorMax.blue -and $reds.Maximum -le $colorMax.red -and $greens.Maximum -le $colorMax.green)
    {
        $validGames += [int]$gameID
    }

    $powerSetValues += ($blues.Maximum * $greens.Maximum * $reds.Maximum)
}

Write-Host "Part One: $(($validGames | Measure-Object -Sum).Sum)"
Write-Host "Part Two: $(($powerSetValues | Measure-Object -Sum).Sum)"