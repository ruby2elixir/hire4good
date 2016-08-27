# Hire4good

A package to quickly collect information about a potential hire.



## Example

```elixir
iex> Hire4Good.Analyzer.analyse("dhh", "contributions")
fetching page 1 for dhh...
fetching page 2 for dhh...
fetching page 3 for dhh...
fetching page 4 for dhh...
*****************************
Analysis for:       dhh
Number of projects: 103
Languages:          CSS, CoffeeScript, HTML, JavaScript, Python, Ruby
Overview
- Ruby: 80
- : 11
- HTML: 4
- CSS: 3
- JavaScript: 2
- CoffeeScript: 2
- Python: 1
*****************************

iex> Hire4Good.Analyzer.analyse("josevalim", "contributions")
Analysis for:       josevalim
Number of projects: 248
Languages:          Brainfuck, C, CSS, CoffeeScript, Elixir, Emacs Lisp, Erlang, Go, HTML, JavaScript, Perl, Python, Ruby, Shell, VimL
Overview
- Ruby: 120
- Elixir: 50
- Erlang: 31
- : 15
- JavaScript: 11
- CSS: 6
- CoffeeScript: 3
- C: 3
- HTML: 2
- VimL: 1
- Shell: 1
- Python: 1
- Perl: 1
- Go: 1
- Emacs Lisp: 1
- Brainfuck: 1
```


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `hire4good` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:hire4good, "~> 0.1.0"}]
    end
    ```

  2. Ensure `hire4good` is started before your application:

    ```elixir
    def application do
      [applications: [:hire4good]]
    end
    ```

