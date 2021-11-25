defmodule PPR.Repo do
  use Ecto.Repo,
    otp_app: :ppr,
    adapter: Ecto.Adapters.Postgres

  def init(_type, config) do
    {:ok, config}
  end
end
