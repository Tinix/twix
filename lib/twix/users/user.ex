defmodule Twix.Users.User do
  @moduledoc """
  The User schema represents a user in the Twix application.
  It includes fields for nickname, email, and age, and has a relationship with posts.
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias Twix.Posts.Post

  @required_params [:nickname, :email, :age]

  schema "users" do
    field :nickname, :string
    field :email, :string
    field :age, :integer

    has_many :posts, Post

    timestamps()
  end

  def changeset(user, \\ %__MODULE__{}, params) do
    user
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:nickname, min: 2)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> unique_constraint(:nickname)
    |> unique_constraint(:email)
  end
end
