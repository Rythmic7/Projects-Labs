<#
    Date       : 12/06/2025
    Description: Compares two lists to determine whether they are equal,
                 whether one list is a sublist of the other, or if they
                 have no list relationship at all.
#>

# Enum describing the four possible list relationships
enum Sublist {
    EQUAL
    SUBLIST
    SUPERLIST
    UNEQUAL
}

Function Invoke-Sublist($Data1, $Data2) {

    # Join each list into a comma-delimited string and append
    # a trailing comma to avoid partial-match issues
    $s1 = ($Data1 -join ",") + ","
    $s2 = ($Data2 -join ",") + ","

    # If strings match exactly → lists are equal
    if ($s1 -eq $s2) { 
        [Sublist]::EQUAL 
    }

    # If Data1 appears fully inside Data2 → Data1 is a sublist
    elseif ($s2.Contains($s1)) { 
        [Sublist]::SUBLIST 
    }

    # If Data2 appears fully inside Data1 → Data1 is a superlist
    elseif ($s1.Contains($s2)) { 
        [Sublist]::SUPERLIST 
    }

    # Otherwise → lists are not related
    else { 
        [Sublist]::UNEQUAL 
    }
}
