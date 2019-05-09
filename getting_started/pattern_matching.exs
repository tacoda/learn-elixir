# The match operator
x = 1
x # => 1

1 = x # => 1
# 2 = x # => (MatchError) no match of right hand side value: 1

# Notice that 1 = x is a valid expression, and it matched because both the left and right side are equal to 1. When the sides do not match, a MatchError is raised.

# A variable can only be assigned on the left side of =:
# 1 = unknown # => (CompileError) iex:1: undefined function unknown/0

# Pattern Matching
{a, b, c} = {:hello, "world", 42} # => {:hello, "world", 42}
a # => :hello
b # => "world"

# A pattern match will error if the sides can’t be matched, for example if the tuples have different sizes:
# {a, b, c} = {:hello, "world"} # => (MatchError) no match of right hand side value: {:hello, "world"}
# And also when comparing different types:
# {a, b, c} = [:hello, "world", 42] # => (MatchError) no match of right hand side value: [:hello, "world", 42]

# More interestingly, we can match on specific values. The example below asserts that the left side will only match the right side when the right side is a tuple that starts with the atom :ok
{:ok, result} = {:ok, 13} # => {:ok, 13}
result # => 13
# {:ok, result} = {:error, :oops} # => (MatchError) no match of right hand side value: {:error, :oops}

# Pattern match on lists too
[a, b, c] = [1, 2, 3] # => [1, 2, 3]
a # => 1

# Also supports splitting head and tail
[head | tail] = [1, 2, 3] # => [1, 2, 3]
head # => 1
tail # => [2, 3]

[h | t] = [] # => (MatchError) no match of right hand side value: []
# Used for pattern matching and prepending items to a list

list = [1, 2, 3] # => [1, 2, 3]
[0 | list] # => [0, 1, 2, 3]

# Pin operator

# Variables in Elixir can be rebound
x = 1 # => 1
x = 2 # => 2

# Use the pin operator ^ when you want to pattern match against an existing variable’s value rather than rebinding the variable
x = 1 # => 1
# ^x = 2 # => (MatchError) no match of right hand side value: 2
{y, ^x} = {2, 1} # => {2, 1}
y # => 2
# {y, ^x} = {2, 2} # => (MatchError) no match of right hand side value: {2, 2}

# If a variable is mentioned more than once in a pattern, all references should bind to the same pattern
{x, x} = {1, 1} # => {1, 1}
# {x, x} = {1, 2} # => (MatchError) no match of right hand side value: {1, 2}

# In some cases, you don’t care about a particular value in a pattern. It is a common practice to bind those values to the underscore, _. For example, if only the head of the list matters to us, we can assign the tail to underscore
[h | _] = [1, 2, 3] # => [1, 2, 3]
h # => 1

# The variable _ is special in that it can never be read from. Trying to read from it gives a compile error
# _ # => (CompileError) iex:1: invalid use of _. "_" represents a value to be ignored in a pattern and cannot be used in expressions

# Although pattern matching allows us to build powerful constructs, its usage is limited. For instance, you cannot make function calls on the left side of a match. The following example is invalid:
# length([1, [2], 3]) = 3 # => (CompileError) iex:1: cannot invoke remote function :erlang.length/1 inside match
