FROM bitwalker/alpine-elixir-phoenix:1.12 as release

WORKDIR /app

RUN mix do local.hex --force, local.rebar --force

COPY config/ /app/config/
COPY mix.exs /app/
COPY mix.* /app/

COPY apps/portal/mix.exs /app/apps/portal/
COPY apps/ppr/mix.exs /app/apps/ppr/

ENV MIX_ENV=prod
RUN mix do deps.get --only $MIX_ENV
RUN mix deps.compile

COPY . /app/

RUN MIX_ENV=prod mix release

FROM bitwalker/alpine-elixir-phoenix:1.12 AS runtime

EXPOSE 4000
ENV PORT=4000 \
  MIX_ENV=prod \
  SHELL=/bin/bash

WORKDIR /app
COPY --from=release app/_build/prod/rel/backend .
COPY --from=release app/bin/ ./bin

CMD ["./bin/entrypoint"]
