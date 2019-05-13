# case

case {1, 2, 3} do
  {4, 5, 6} ->
    "This clause won't match"
  {1, x, 3} ->
    "This clause will match and bind x to 2 in this clause"
  _ ->
    "This clause would match any value"
end

# Remember the pin operator if you need to pattern match against an existing variable
x = 1
case 10 do
  ^x -> "Won't match"
  _ -> "Will match"
end

# Guards can be used to specify extra conditions
case {1, 2, 3} do
  {1, x, 3} when x > 0 ->
    "Will match"
  _ ->
    "Would match, if guard condition were not satisfied"
end

# Errors do not leak, but cause the guard to fail
case 1 do
  x when hd(x) -> "Won't match"
  x -> "Got #{x}"
end

# If none of the clauses match, an error is raised
# case :ok do
#   :error -> "Won't match"
# end
# (CaseClauseError) no case clause matching: :ok

# Anonymous functions can also have multiple clauses and guards
f = fn
  x, y when x > 0 -> x + y
  x, y -> x * y
end
f.(1, 3) # => 4
f.(-1, 3) # => -3

# Number of arugments must be the same or an error is raised
# f2 = fn
#   x, y when x > 0 -> x + y
#   x, y, z -> x * y + z
# end
# (CompileError) iex:1: cannot mix clauses with different arities in anonymous functions

# cond

# case is useful when you need to match against different values. However, in many circumstances, we want to check different conditions and find the first one that evaluates to true. In such cases, one may use cond

cond do
  2 + 2 == 5 ->
    "This will not be true"
  2 * 2 == 3 ->
    "Nor this"
  1 + 1 == 2 ->
    "But this will"
end

# If none of the conditions return true, an error (CondClauseError) is raised. For this reason, it may be necessary to add a final condition, equal to true, which will always match

cond do
  2 + 2 == 5 ->
    "This is never true"
  2 * 2 == 3 ->
    "Nor this"
  true ->
    "This is always true (equivalent to else)"
end

# Finally, note cond considers any value besides nil and false to be true

cond do
  hd([1, 2, 3]) ->
    "1 is considered as true"
end

# if and unless

if true do
  "This works!"
end

unless true do
  "This will never be seen"
end

# else blocks also supported

if nil do
  "This won't be seen"
else
  "This will"
end

# do/end blocks

if true, do: 1 + 2

# Notice how the example above has a comma between true and do:, that’s because it is using Elixir’s regular syntax where each argument is separated by a comma. We say this syntax is using keyword lists. We can pass else using keywords too

if false, do: :this, else: :that

# These are equivalent

if true do
  a = 1 + 2
  a + 10
end

if true, do: (
  a = 1 + 2
  a + 10
)

# One thing to keep in mind when using do/end blocks is they are always bound to the outermost function call. For example, the following expression

# is_number if true do
#   1 + 2
# end

# Would be parsed as

# is_number(if true) do
#   1 + 2
# end

# Adding explicit parentheses is enough to bind the block to if

is_number(if true do
  1 + 2
end)
