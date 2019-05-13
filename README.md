# Learn Elixir

## Basics

- `iex`
- `elixir`
- `elixirc`

To exit `iex`, `Ctrl+C` twice

To run `iex` with `SCRIPTNAME` loaded, `iex -S SCRIPTNAME`

In `iex`, you can type `h()` in the shell to print information on how to use the shell. The `h` helper can also be used to access documentation for any function. For example, typing `h is_integer/1` is going to print the documentation for the `is_integer/1` function. It also works with operators and other constructs (try `h ==/2`).

In `iex`, if you are unsure of a value use `i` to retrieve information about it. For example, `i 'hello'`.

```elixir
IO.puts "Hello world from Elixir"
```

```sh
$ elixir simple.exs
Hello world from Elixir
```

## Getting Started

- [Basic types](/getting_started/basic_types.exs)
- [Basic operators](getting_started/basic_operators.exs)
- [Pattern matching](getting_started/pattern_matching.exs)
- [Case, cond, and if](getting_started/case_cond_and_if.exs)

## Mix and OTP

## Metaprogramming
