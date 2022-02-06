defmodule ApargWeb.PageController do
  use ApargWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", token: get_csrf_token())
  end

  def create(conn, %{"images" => images}) do

    uris =
    Enum.map(images, fn image ->
      prefix =
      DateTime.utc_now
      |> DateTime.to_unix(:millisecond)

      extension = Path.extname(image.filename)
      static_path = "priv/static/"
      new_name = "uploads/#{prefix}-#{image.filename}#{extension}"
      File.cp!(image.path, "#{static_path}#{new_name}")

      new_name
    end)

    render(conn, "index.html", uris: Enum.join(uris, ":::"))
  end
end
