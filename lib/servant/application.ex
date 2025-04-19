defmodule Servant.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    env = Mix.env()

    unless env == :test do
      Application.ensure_all_started(:nostrum)
    end

    children = [
      Servant.Repo,
      Servant.Calendar.Supervisor,
      Servant.Ports.Supervisor
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Servant.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
