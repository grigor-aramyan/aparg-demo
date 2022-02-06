defmodule ApargWeb.VideoGeneratorResolver do
  def generate_video(_root, _args, _info) do
    {:ok, "something"}
  end

  def create_timeline(_root, args, _info) do
    # args.images

    {:ok, length(args.images)}
  end
end
