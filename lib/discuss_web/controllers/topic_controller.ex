defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  alias Discuss.Topic

  def index(conn, _params) do

  end

  def new(conn, params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, post} ->

      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
        IO.inspect(changeset)
    end
  end
end
