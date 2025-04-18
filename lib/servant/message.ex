defmodule Servant.Message do
  use Ecto.Schema
  import Ecto.Changeset
  import TypedEctoSchema

  typed_schema "messages" do
    field(:message_id, :string)
    field(:channel_id, :string)
    field(:author_id, :string)
    field(:content, :string)
    field(:timestamp, :utc_datetime)

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:message_id, :channel_id, :author_id, :content, :timestamp])
    |> validate_required([:message_id, :channel_id, :author_id])
    |> unique_constraint(:message_id)
  end
end
