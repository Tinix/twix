defmodule Twix.Users.Get do
  alias Twix.Repo
  alias Twix.Users.User

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, "User not found"}
      user -> {:ok, Repo.preload(user, :posts)}
    end
  end
end
