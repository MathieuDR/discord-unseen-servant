defmodule Servant.Calendar.Supervisor do
  @moduledoc false
  use Supervisor

  def start_link(args) do
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    children = [
      {
        Servant.Calendar.Scheduler,
        %Servant.Calendar.Scheduler{
          timeout: 5 * 1000,
          healthcheck_url: nil
        }
      }
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
