defmodule Servant.Ports.Discord.Consumer do
  @moduledoc false
  use Nostrum.Consumer

  alias Nostrum.Api

  require Logger

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:READY, data, _ws_state}) do
    Logger.notice("Discord bot connected successfully!", data: data)
  end

  def handle_event(_event) do
    :noop
  end
end
