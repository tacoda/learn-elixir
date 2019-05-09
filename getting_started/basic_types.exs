# Some Basic Types

1 # integer
0x1F # integer
1.0 # float
true # boolean
:atom # atom / symbol
"elixir" # string
[1, 2, 3] # list
{1, 2, 3} # tuple

# Basic Arithmetic
1 + 2 # => 3
5 * 5 # => 25
10 / 2 # => 5.0 NOTICE: This is a float
div(10, 2) # => 5
div 10, 2 # => 5
rem 10, 3 # => 1

# Numbers
0b1010 # => 10
0o777 # => 511
0x1F # => 31

1.0 # Float numbers require a dot followed by at least one digit
1.0e-10 # Float numbers also support scientific notation
# Floats in Elixir are 64-bit

round(3.58) # => 4
trunc(3.58) # => 3

# Functions are identified by their name and arity

# Booleans
true # => true
true == false # => false
is_boolean(true) # => true
is_boolean(1) # => false

# Atoms
:hello # => :hello
:hello == :world # => false

# true and false are atoms
true == :true # => true
is_atom(false) # => true
is_boolean(:false) # => true
# Aliases are also atoms
is_atom(Hello) # => true

# Strings

# UTF-8 encoded
"hellö" # => "hellö"
"hellö #{:world}" # => "hellö world"
"hello\nworld" # => "hello\nworld"

IO.puts "hello\nworld" # => :ok

# Strings are are represented internally by binaries (sequences of bytes)

is_binary("hellö") # => true
byte_size("hellö") # => 6
String.length("hellö") # => 5

# String Module
# https://hexdocs.pm/elixir/String.html

String.upcase("hellö") # => "HELLÖ"

# Anonymous Functions

add = fn a, b -> a + b end
add.(1, 2) # => 3
is_function(add) # => true
is_function(add, 2) # => true
is_function(add, 1) # => false

# Functions are first-class citizens in Elixir
# A dot (.) between the variable and the parentheses is required to invoke an anonymous function
# Anonymous funtions are closures

double = fn a -> add.(a, a) end

x = 42
(fn -> x = 0 end).() # => 0
x # => 42

# Lists

# Elixir uses linked lists
# Values can be of any type

[1, 2, true, 3] # => [1, 2, true, 3]
length [1, 2, 3] # => 3
[1, 2, 3] ++ [4, 5, 6] # => [1, 2, 3, 4, 5, 6]
[1, true, 2, false, 3, true] -- [true, false] # => [1, 2, 3, true]

# Elixir data structures are immutable
# Concatenating to or removing from a list returns a new list

list = [1, 2, 3]
hd(list) # => 1
tl(list) # => [2, 3]
# hd [] # => (ArgumentError) argument error

# When Elixir sees a list of printable ASCII numbers, it will print them as a charlist

# Single-quoted and double-quoted strings are not equivalent because they are different types
'hello' == "hello" # => false

# Tuples

# Tuples can hold any value

{:ok, "hello"} # => {:ok, "hello"}
tuple_size {:ok, "hello"} # => 2

# Tuples are store contiguously in memory, so accessing an element by index is fast

tuple = {:ok, "hello"}
elem(tuple, 1) # => "hello"
put_elem(tuple, 1, "world") # => {:ok, "world"}
tuple # => {:ok, "hello"}

# Lists or Tuples?

# Lists are stored in memory as linked lists, meaning that each element in a list holds its value and points to the following element until the end of the list is reached. This means accessing the length of a list is a linear operation: we need to traverse the whole list in order to figure out its size.
# Tuples, on the other hand, are stored contiguously in memory. This means getting the tuple size or accessing an element by index is fast. However, updating or adding elements to tuples is expensive because it requires creating a new tuple in memory.
# Note that this applies only to the tuple itself, not its contents. For instance, when you update a tuple, all entries are shared between the old and the new tuple, except for the entry that has been replaced. In other words, tuples and lists in Elixir are capable of sharing their contents. This reduces the amount of memory allocation the language needs to perform and is only possible thanks to the immutable semantics of the language.
# One very common use case for tuples is to use them to return extra information from a function.
# When counting the elements in a data structure, Elixir also abides by a simple rule: the function is named size if the operation is in constant time (i.e. the value is pre-calculated) or length if the operation is linear (i.e. calculating the length gets slower as the input grows). As a mnemonic, both “length” and “linear” start with “l”.
