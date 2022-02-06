defmodule ApargWeb.VideoGeneratorResolver do
  def generate_video(_root, _args, _info) do
    {:ok, "something"}
  end

  def create_timeline(_root, _args, _info) do
    filename =
      DateTime.utc_now
      |> DateTime.to_unix(:millisecond)

    System.cmd("ffmpeg", ["-framerate", "1/1", "-i", "priv/static/images.txt", "-vsync", "vfr", "-pix_fmt", "yuv420p", "priv/static/videos/#{filename}.mp4"])
    File.rm("priv/static/images.txt")

    {:ok, "priv/static/videos/#{filename}.mp4"}
  end
end
