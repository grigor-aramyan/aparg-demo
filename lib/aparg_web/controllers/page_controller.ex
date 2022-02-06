defmodule ApargWeb.PageController do
  use ApargWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", token: get_csrf_token())
  end

  def create(conn, %{"images" => images}) do
    case File.open("priv/static/images.txt", [:append]) do
      {:ok, io_device} ->
        uris =
        Enum.map(Enum.with_index(images), fn {image, index} ->
          prefix =
          DateTime.utc_now
          |> DateTime.to_unix(:millisecond)

          extension = Path.extname(image.filename)
          static_path = "priv/static/"
          new_name = "uploads/#{prefix}-#{image.filename}#{extension}"
          File.cp!(image.path, "#{static_path}#{new_name}")
          IO.write(io_device, "file '#{static_path}#{new_name}'\n")
          IO.write(io_device, "duration 1\n")

          # fixing bug with ffmpeg concat demuxer
          if index == length(images) - 1 do
            IO.write(io_device, "file '#{static_path}#{new_name}'\n")
          end

          new_name
        end)
        render(conn, "index.html", uris: Enum.join(uris, ":::"))
      {:error, _reason} ->
        render(conn, "index.html")
    end
  end
end
