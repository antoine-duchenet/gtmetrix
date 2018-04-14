# GTmetrix

GTmetrix is an [Elixir](https://elixir-lang.org/) [GTmetrix](https://gtmetrix.com/) client.
It currently supports all [GTmetrix REST API](https://gtmetrix.com/api/) routes returning JSON data.
Support of non-JSON data routes (Pagespeed files archive, screenshot, video & PDF report) is planned.

## Installation

The package is [available in Hex](https://hex.pm/packages/gtmetrix), it can be installed by adding `gtmetrix` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:gtmetrix, "~> 1.0.0"}
  ]
end
```

## Required configuration

GTmetrix API requires API credentials.
Those credentials can be provided via the `basic_auth:` configuration key.

```elixir
# config/secret.exs
use Mix.Config

config :gtmetrix, basic_auth: {"user@example.com", "6aa6883a1219079809058208830f61ab"}
```

## Hexdocs
The incomplete docs can be found at [https://hexdocs.pm/gtmetrix](https://hexdocs.pm/gtmetrix).
Docs are on the way !

