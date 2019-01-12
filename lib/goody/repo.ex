defmodule Goody.Repo do
  use Ecto.Repo,
    otp_app: :goody,
    adapter: Ecto.Adapters.Postgres
end
