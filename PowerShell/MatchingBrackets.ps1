<#
    Date       : 12/06/2025
    Description: Validates whether all brackets in a string are matched and
                 properly nested. Supports (), {}, and [] while ignoring all
                 non-bracket characters.
#>

Function Test-MatchingBrackets() {

    [CmdletBinding()]
    Param(
        [string]$Text
    )

    # Mapping of opening → closing brackets
    $brackets = @{
        '[' = ']'
        '{' = '}'
        '(' = ')'
    }

    # Remove all non-bracket characters and convert to character array
    $chars = ($Text -replace '[^[\](){}]', '').ToCharArray()

    # Use a stack to track opening brackets
    $stack = New-Object System.Collections.Stack

    foreach ($char in $chars) {

        # Convert character to string
        $current = $char.ToString()

        # If opening bracket, push onto the stack
        if ($brackets.ContainsKey($current)) {
            $stack.Push($current)
            continue
        }

        # If a closing bracket appears with nothing to match → invalid
        if ($stack.Count -eq 0) {
            return $false
        }

        # Pop the last opening bracket and check if it matches
        $last = $stack.Pop()

        if ($brackets[$last] -ne $current) {
            return $false
        }
    }

    # Valid only if *all* opening brackets were matched
    return ($stack.Count -eq 0)
}
