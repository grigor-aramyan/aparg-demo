defmodule ApargWeb.Schema do
  use Absinthe.Schema

  import_types Absinthe.Plug.Types

  alias ApargWeb.VideoGeneratorResolver

  # unused in app but w/o it getting root query must be implemented error
  # maybe editor plugins bugs
  query do
    @desc "Generate video"
    field :create_video, non_null(:string) do
      resolve(&VideoGeneratorResolver.generate_video/3)
    end
  end

  mutation do
    @desc "Create timeline"
    field :create_timeline, non_null(:string) do
      arg :images, list_of(non_null(:string))

      resolve(&VideoGeneratorResolver.create_timeline/3)
    end
  end
end
