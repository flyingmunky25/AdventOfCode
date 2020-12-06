# Get the content, and split it into its chunks, and into an array
$content = (Get-Content .\input.txt -Raw) -split '\r\n\r\n'

# Create an array to store the count of keys from each passport
$passportsList = @()
$content | ForEach-Object {
        # Split the record and remove any line returns and spaces. Then convert the result string into a hashtable
        $passport = $_ -split '(\r\n)|\s' 
        $hash = @{}
        # Convert the record to a hash table
        $passport | Where-Object {$_ -notmatch '\r\n'} | ForEach-Object {
            $keyvalue = $_.Split(':')
            $hash.Add($keyvalue[0],$keyvalue[1])
        }
        # Validate the fields
        $hash.Remove('cid')

        $isValid = $true
        $hash = $hash.GetEnumerator() | ForEach-Object{
            $val = $_.Value

            switch($_.Key)
            {
                'byr' { if ( $val -notin 1920..2002 ) { $isValid = $false } }
                'iyr' { if ( $val -notin 2010..2020 ) { $isValid = $false } }
                'eyr' { if ( $val -notin 2020..2030 ) { $isValid = $false } }
                'hgt' {
                    switch -regex ($val) {
                        "cm" { if ( ([regex]::Matches($value,'(\d+)|(\D+)')).Value[0] -notin 150..193) { $isValid = $false } }
                        "in" { if ( ([regex]::Matches($value,'(\d+)|(\D+)')).Value[0] -notin 59..76) { $isValid = $false } }
                        Default { $isValid = $false}
                    }
                 }
                'ecl' { if ( $val -notin @("amb","blu","brn","gry","grn","hzl","oth")) { $isValid = $false } }
                'pid' { if ( $val -notmatch '\d{9}') { $isValid = $false } }
                'hcl' { if ( $val -notmatch '#[0-9a-fA-F]{6}' ) {$isValid = $false } }
                Default { $isValid = $false }
            }
        }
        if ( $isValid)
        {
            $passportsList += $passport.Keys.Count
        }
}    
# Output the number of values that are 7 or higher
Write-Host ($passportsList | Where-Object {$_ -ge 7}).Count