defmodule PPR.EventStore do
  use EventStore,
    otp_app: :ppr,
    serializer: Commanded.Serialization.JsonSerializer

  def init(config) do
    {:ok, config}
  end
end
