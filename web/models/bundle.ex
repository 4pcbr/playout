defmodule Playout.Bundle do
  use Playout.Web, :model
  use Arc.Ecto.Model

  @versions [:original]

  @primary_key { :id, :binary_id, autogenerate: true }

  schema "bundles" do
    field :name, :string
    field :description, :string
    field :content_type, :string
    field :file, Playout.BundleFile.Type

    timestamps
  end

  @required_fields ~w(name content_type)
  @optional_fields ~w(description)

  @required_file_fields ~w()
  @optional_file_fields ~w(file)

  def changeset( model, params \\ :empty ) do
    model
      |> cast( params, @required_fields, @optional_fields )
      |> cast_attachments( params, @required_file_fields, @optional_file_fields )
      |> validate_length( :name, min: 2 )
  end

end

