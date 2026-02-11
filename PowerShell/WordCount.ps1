<#
    Date       : 12/06/2025
    Description: Counts occurrences of each distinct word in a phrase after
                 cleaning punctuation and normalizing text.
#>

Function Get-WordCount() {

    [CmdletBinding()]
    Param(
        [string]$Phrase
    )

    # Create a hashtable to store word → count pairs
    $r = @{}

    # Replace odd apostrophe patterns with spaces
    $Phrase = $Phrase -replace "(\W'+|'+\W)", " "

    # Remove leading or trailing apostrophes entirely
    $Phrase = $Phrase -replace "(^'+|'+$)" , ""

    # Replace punctuation/symbols with spaces
    $Phrase = $Phrase -replace "[:\n,$@%&!^\._]", " "

    # Convert to lowercase, split into words, ignore empty entries
    $Phrase.ToLower() -split "\s+" | Where-Object { $_ } | ForEach-Object {

        # If word already exists in the hashtable, increment count
        if ($_ -in $r.Keys) {
            $r[$_] = $r[$_] + 1
        }
        # Otherwise, add word with initial count of 1
        else {
            $r.add($_, 1)
        }
    }

    # Return the hashtable of word counts
    return $r
}
