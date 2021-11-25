defmodule PPR.Router do
  use Commanded.Commands.Router

  middleware(PPR.Middleware.CommandValidation)
end
