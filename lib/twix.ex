defmodule Twix do
  alias Twix.Users
  alias Twix.Posts

  defdelegate create_user(params), to: Users.Create, as: :call
  defdelegate get_user(id), to: Users.Get, as: :call
  defdelegate update_user(params), to: Users.Update, as: :call

  defdelegate create_post(params), to: Posts.Create, as: :call
  defdelegate add_like_to_post(id), to: Posts.AddLike, as: :call
end
