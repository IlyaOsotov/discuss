defmodule Discuss.Repo.Migrations.AddTopics do
  use Ecto.Migration

  # FYI mix ecto.gen.migration add_topics
  # mix ecto.migrate

  def change do
    create table(:topics) do
      add :title, :string

      timestamps()
    end
  end
end
