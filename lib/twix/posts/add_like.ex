defmodule Twix.Posts.AddLike do
  alias Twix.Posts.Post
  alias Twix.Repo

  alias Ecto.Changeset

  def call(id) do
    case Repo.get(Post, id) do
      nil -> {:error, "Post not found"}
      post -> add_like(post)
    end
  end

  defp add_like(post) do
    likes = post.likes + 1

    post
    |> Ecto.Changeset.change(likes: likes)
    |> Repo.update()
  end
end
