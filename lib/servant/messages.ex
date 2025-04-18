defmodule Servant.Messages do
  @moduledoc """
  The Messages context.
  """

  import Ecto.Query, warn: false
  alias Servant.Repo
  alias Servant.Message

  @doc """
  Returns the list of messages.
  """
  def list_messages do
    Repo.all(Message)
  end

  @doc """
  Gets a single message by message_id.
  """
  def get_message!(message_id) do
    Repo.get_by!(Message, message_id: message_id)
  end

  @doc """
  Creates a message.
  """
  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a message.
  """
  def update_message(%Message{} = message, attrs) do
    message
    |> Message.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a message.
  """
  def delete_message(%Message{} = message) do
    Repo.delete(message)
  end
end
