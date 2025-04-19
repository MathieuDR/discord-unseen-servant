defmodule Servant.Calendar.Scheduler do
  use GenServer
  use TypedStruct
  require Logger

  typedstruct do
    field(:healthcheck_url, String.t())
  end

  def start_link(_state) do
    GenServer.start_link(__MODULE__, %__MODULE__{}, name: __MODULE__)
  end

  @impl true
  def init(init_arg) do
    {:ok, init_arg}
  end

  @impl true
  def handle_info(:update, %__MODULE__{} = state) do
    Logger.info("Am updating")
    schedule(state)
    {:noreply, state}
  end

  def schedule(%__MODULE__{} = _state) do
    now = DateTime.utc_now()

    timeout =
      DateTime.add(now, 30, :second)
      |> DateTime.diff(now)

    Process.send_after(self(), :update, timeout)
    Logger.info("Scheduled next update in", timeout_in_ms: timeout)

    timeout
  end
end
