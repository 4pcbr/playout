defmodule Playout.Bundle do
  use Playout.Web, :model

  @primary_key { :id, :binary_id, autogenerate: true }

  schema "bundles" do
    field :name, :string
    field :description, :string
    field :content_type, :string
    field :system_path, :string

    timestamps
  end

  @required_fields ~w(name content_type system_path)
  @optional_fields ~w()

end
