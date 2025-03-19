defmodule TwixWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  object :user do
    field :id, non_null(:id)
    field :nickname, non_null(:string)
    field :email, non_null(:string)
    field :age, non_null(:integer)
  end
end
