defmodule Servant.Calendar.Scheduler do
  @moduledoc false
  use GenServer
  use TypedStruct

  require Logger

  typedstruct do
    field :healthcheck_url, String.t()
    field :timeout, pos_integer()
  end

  def start_link(%__MODULE__{} = init_arg) do
    GenServer.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(init_arg) do
    state = schedule(init_arg)
    {:ok, state}
  end

  @impl true
  def handle_info(:update, %__MODULE__{} = state) do
    Logger.info("Am updating")
    schedule(state)
    {:noreply, state}
  end

  def schedule(%__MODULE__{timeout: timeout} = state) do
    Process.send_after(self(), :update, timeout)
    Logger.info("Scheduled next update in", timeout_in_ms: timeout)

    %{state | timeout: timeout}
  end
end
