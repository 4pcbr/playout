defmodule Playout.BundleFile do
  use Arc.Definition

  use Arc.Ecto.Definition

  @versions [:original]

  def __storage, do: Arc.Storage.Local

  def filename( version, { file, scope } ) do
    "#{version}-#{file.file_name}"
  end

  # def storage_dir( version, scope ) do
  #   "content_files/#{scope.id}"
  # end

end
