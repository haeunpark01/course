defmodule Course.Courses.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :description, :string
    field :image, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:image, :title, :description])
    |> validate_required([:image, :title, :description])
  end
end
