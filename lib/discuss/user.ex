defmodule Discuss.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Discuss.User

  @derive { Jason.Encoder, only: [:nickname] }

  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string
    field :nickname, :string
    field :avatar, :string

    has_many :topics, Discuss.Topic
    has_many :comments, Discuss.Comment

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :provider, :token, :nickname, :avatar])
    |> validate_required([:email, :provider, :token, :nickname, :avatar])
  end
end