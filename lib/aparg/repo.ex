defmodule Aparg.Repo do
  use Ecto.Repo,
    otp_app: :aparg,
    adapter: Ecto.Adapters.Postgres
end
