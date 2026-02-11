<#
    Date       : 12/06/2025
    Description: Implements basic list operations such as append, concatenate,
                 filter, length, map, and fold functions without using built-in
                 list helpers. Also provides reverse functionality.
#>

Function Invoke-Append() {
    [CmdletBinding()]
    Param(
        [object[]]$List1,
        [object[]]$List2
    )

    # Combine both lists into one
    [object[]]$a = $List1 + $List2

    # Return as array
    ,$a
}

Function Invoke-Concatenate() {
    [CmdletBinding()]
    Param(
        [object[]]$Lists
    )

    # Holder for the flattened list
    [object[]]$a = @()

    # Add each list’s items in order
    foreach ($list in $Lists) {
        $a += $list
    }

    ,$a
}

Function Invoke-Filter() {
    [CmdletBinding()]
    Param(
        [object[]]$List,
        [scriptblock]$Predicate
    )

    # Holder for filtered results
    [object[]]$a = @()

    # Add only the elements that satisfy the predicate
    foreach ($item in $List) {
        if ($Predicate.Invoke($item)) {
            $a += $item
        }
    }

    ,$a
}

Function Get-Length() {
    [CmdletBinding()]
    Param(
        [object[]]$List
    )

    # Manual counter
    $c = 0
    foreach ($item in $List) {
        $c++
    }

    # Return count
    $c
}

Function Invoke-Map() {
    [CmdletBinding()]
    Param(
        [object[]]$List,
        [scriptblock]$Function
    )

    # Holder for mapped results
    [object[]]$a = @()

    # Apply function to each item
    foreach ($item in $List) {
        $a += $Function.Invoke($item)
    }

    ,$a
}

Function Invoke-Foldl() {
    [CmdletBinding()]
    Param(
        [scriptblock]$Function,
        [object[]]$List,
        [object]$Accumulator
    )

    # Start with initial accumulator
    $r = $Accumulator

    # Fold left → apply function from first item to last
    foreach ($item in $List) {
        $r = &$Function -acc $r -e $item
    }

    $r
}

Function Invoke-Foldr() {
    [CmdletBinding()]
    Param(
        [scriptblock]$Function,
        [object[]]$List,
        [object]$Accumulator
    )

    # Start at last index
    $c = (Get-Length $List) - 1
    $r = $Accumulator

    # Fold right → apply from last item to first
    for ($i = $c; $i -ge 0; $i--) {
        $r = &$Function -e $List[$i] -acc $r
    }

    $r
}

Function Invoke-Reverse() {
    [CmdletBinding()]
    Param(
        [object[]]$List
    )

    # Holder for reversed output
    [array]$a = @()

    # Start at last index
    $c = (Get-Length $List) - 1

    # Walk backwards to reverse items
    for ($i = $c; $i -ge 0; $i--) {

        # Ensure nested arrays remain arrays and not item-expanded
        if ($List[$i] -is [array]) {
            $a += ,$List[$i]
        }
        else {
            $a += $List[$i]
        }
    }

    ,$a
}

# Example call
$got = Invoke-Reverse -List @( @(1, 2), @(3), @(), @(4, 5, 6) )
get $got