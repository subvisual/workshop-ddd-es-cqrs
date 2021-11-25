defmodule PPR.App do
  @moduledoc false

  use Commanded.Application,
    otp_app: :ppr,
    event_store: [
      adapter: Commanded.EventStore.Adapters.EventStore,
      event_store: PPR.EventStore
    ]

  router(PPR.Router)
end
