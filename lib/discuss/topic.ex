defmodule Discuss.Topic do
  use Ecto.Schema
  import Ecto.Changeset
  alias Discuss.Topic

  schema "topics" do
    field :title, :string

    belongs_to :user, Discuss.User

    timestamps()
  end

  # FYI
  # changeset = Discuss.Topic.changeset(struct, %{title: "JS"})
  # Discuss.Repo.insert(changeset)
  # NOT Discuss.Repo.insert(%Discuss.Topic{})
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
