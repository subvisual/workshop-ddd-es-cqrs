defmodule PPR.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PPR.App,
      PPR.Repo
    ]

    opts = [strategy: :one_for_one, name: PPR.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
