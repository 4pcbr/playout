defmodule Playout.Repo.Migrations.CreateBundle do
  use Ecto.Migration

  def change do
    create table(:bundles, primary_key: false) do
      add :id,           :uuid,   primary_key: true
      add :name,         :string, null: false
      add :description,  :string
      add :content_type, :string
      add :system_path,  :string

      timestamps
    end
  end
end
