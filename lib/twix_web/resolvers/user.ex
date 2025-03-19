defmodule TwixWeb.Resolvers.User do
  alias Twix.Users
  # def get(%{id: id}, _context), do: Twix.get_user(id)
  #
  def get(%{id: id}, _context) do
    case Users.get_user(id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
