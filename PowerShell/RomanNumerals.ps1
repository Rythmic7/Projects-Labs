<#
    Date       : 12/06/2025
    Description: Converts a positive integer (1–3999) into its Roman numeral
                 representation using standard Roman numeral rules.
#>

Function Get-RomanNumerals() {
    Param(
        [int]$Number
    )

    # Validate input (Roman numerals only defined for 1–3999)
    if ($Number -lt 1 -or $Number -gt 3999) {
        Throw 'Number has to be positive integer in range of 1-3999.'
    }

    # Array to store Roman numeral fragments
    $Roman = @()

    # Ordered mapping of numeric values → Roman numeral symbols
    $RomanNumerals = [ordered]@{
        1000 = 'M'; 900  = 'CM'; 500  = 'D'; 400  = 'CD';
        100  = 'C'; 90   = 'XC'; 50   = 'L'; 40   = 'XL';
        10   = 'X'; 9    = 'IX'; 5    = 'V'; 4    = 'IV';
        1    = 'I'
    }

    # Loop through each Roman numeral value in descending order
    foreach ($Key in $RomanNumerals.Keys) {

        # Determine how many times the numeral fits into the remaining number
        $Multi   = [Math]::Floor($Number / $Key)

        # Subtract the value accounted for by this numeral
        $Number -= $Multi * $Key

        # Append the appropriate Roman numeral fragments
        $Roman  += $RomanNumerals.$Key * $Multi
    }

    # Return Roman numeral string
    return -join $Roman
}
