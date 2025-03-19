defmodule TwixWeb.Schema do
  use Absinthe.Schema

  import_types(TwixWeb.Schema.Types.Root)
  # import_types(TwixWeb.Schema.Types.User)

  query do
    import_fields :root_query
  end
end
