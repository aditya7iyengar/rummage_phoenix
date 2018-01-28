defmodule Rummage.Phoenix do
  @moduledoc """
  `Rummage.Phoenix` is a support framework for `Phoenix` that can be used to manipulate
  `Phoenix` collections and `Ecto` models with Search, Sort and Paginate operations.

  It accomplishes the above operations by using `Rummage.Ecto`, to paginate `Ecto`
  queries and adds Phoenix and HTML support to views and controllers.
  Each operation: Search, Sort and Paginate have their hooks defined in `Rummage.Ecto`
  and is configurable.

  The best part about rummage is that all the three operations: `Search`, `Sort` and
  `Paginate` integrate seamlessly and can be configured separately. To check out their
  seamless integration, please check the information below.

  If you want to check a sample application that uses Rummage, please check
  [this link](https://github.com/Excipients/rummage_phoenix_example).
  """

  @doc """
  `:default_helpers` can also be set at run time
  in the `config.exs` file

  ## Examples
  Returns default `helpers` set in the config
  (`Rummage.Phoenix.Router.Helpers in `Rummage.Phoenix`'s test env):
      iex> alias Rummage.Phoenix
      iex> Phoenix.default_helpers
      Rummage.Phoenix.Router.Helpers
  """
  def default_helpers do
    config(:default_helpers, nil)
  end

  @doc """
  `:default_theme` can also be set at run time
  in the `config.exs` file

  ## Examples
  Returns default `theme` set in the config
  (`:bootstrap in `Rummage.Phoenix`'s test env):
      iex> alias Rummage.Phoenix
      iex> Phoenix.default_theme
      :bootstrap
  """
  def default_theme do
    config(:default_theme, :bootstrap)
  end

  @doc """
  `:default_max_page_links` can also be set at run time
  in the `config.exs` file

  ## Examples
  Returns default `default_max_page_links` set in the config
  (`5 in `Rummage.Phoenix`'s test env):
      iex> alias Rummage.Phoenix
      iex> Phoenix.default_max_page_links
      5
  """
  def default_max_page_links do
    config(:default_max_page_links, 5)
  end

  @doc false
  defp config do
    Application.get_env(:rummage_phoenix, Rummage.Phoenix, [])
  end

  @doc """
  `config` returns the value associated with the given `key` and returns `default` if
  the value is `nil`.

  ## Examples
  Returns value corresponding to config or returns the default value:
      iex> alias Rummage.Phoenix
      iex> Phoenix.config(:x, "default")
      "default"
  """
  def config(key, default \\ nil) do
    config()
    |> Keyword.get(key, default)
    |> resolve_config(default)
  end

  defp resolve_config(value, _default), do: value
end
