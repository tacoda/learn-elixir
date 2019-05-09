# List Manipulation
[1, 2, 3] ++ [4, 5, 6] # => [1, 2, 3, 4, 5, 6]
[1, 2, 3] -- [2] # => [1, 3]

# String Concatenation
"foo" <> "bar" # => "foobar"

# Boolean Operators
# These operators are strict in the sense that they expect a boolean (true or false) as their first argument
true and true # => true
false or is_atom(:example) # => true
# 1 and true # (BadBooleanError) expected a boolean on left-side of "and", got: 1
# or and and are short-circuit operators
false and raise("This error will never be raised") # => false
true or raise("This error will never be raised") # => true

# Elixir also provides ||, && and ! which accept arguments of any type. For these operators, all values except false and nil will evaluate to true.
1 || true # => 1
false || 11 # => 11
nil && 13 # => nil
true && 17 # => 17

!true # => false
!1 # => false
!nil # => true

# As a rule of thumb, use and, or and not when you are expecting booleans. If any of the arguments are non-boolean, use &&, || and !

# Comparison Operators

1 == 1 # => true
1 != 2 # => true
1 < 2 # => true
# The difference between == and === is that the latter is more strict when comparing integers and floats
1 == 1.0 # => true
1 === 1.0 # => false

# Can compare different kinds of data
1 < :atom # => true

# The reason we can compare different data types is pragmatism. Sorting algorithms don’t need to worry about different data types in order to sort. The overall sorting order is defined below:
# number < atom < reference < function < port < pid < tuple < map < list < bitstring
