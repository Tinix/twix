defmodule Twix.Users.Update do
  alias Twix.Repo
  alias Twix.Users.User

  def call(params) when is_map(params) do
    params_as_strings = Map.new(params, fn {key, value} -> {to_string(key), value} end)

    case params_as_strings do
      %{"id" => id} ->
        update_user(id, params_as_strings)

      _ ->
        {:error, "Invalid parameters: missing 'id'"}
    end
  end

  defp update_user(id, params) do
    case Repo.get(User, id) do
      nil ->
        {:error, "User not found"}

      user ->
        params_without_id = Map.delete(params, "id")
        update(user, params_without_id)
    end
  end

  defp update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
