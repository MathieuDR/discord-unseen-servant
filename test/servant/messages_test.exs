defmodule Servant.MessagesTest do
  use Servant.DataCase

  alias Servant.Messages
  alias Servant.Message

  describe "messages" do
    @valid_attrs %{
      message_id: "123456789",
      channel_id: "987654321",
      author_id: "111222333",
      content: "Hello, world!",
      timestamp: DateTime.utc_now() |> DateTime.truncate(:second)
    }
    @update_attrs %{content: "Updated content"}
    @invalid_attrs %{message_id: nil, channel_id: nil, author_id: nil}

    test "list_messages/0 returns all messages" do
      {:ok, message} = Messages.create_message(@valid_attrs)
      assert Messages.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given message_id" do
      {:ok, message} = Messages.create_message(@valid_attrs)
      assert Messages.get_message!(message.message_id) == message
    end

    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = Messages.create_message(@valid_attrs)
      assert message.message_id == "123456789"
      assert message.channel_id == "987654321"
      assert message.author_id == "111222333"
      assert message.content == "Hello, world!"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messages.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      {:ok, message} = Messages.create_message(@valid_attrs)
      assert {:ok, %Message{} = updated} = Messages.update_message(message, @update_attrs)
      assert updated.content == "Updated content"
    end

    test "delete_message/1 deletes the message" do
      {:ok, message} = Messages.create_message(@valid_attrs)
      assert {:ok, %Message{}} = Messages.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Messages.get_message!(message.message_id) end
    end
  end
end
