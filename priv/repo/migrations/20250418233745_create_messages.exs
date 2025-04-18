defmodule Servant.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add(:message_id, :string, null: false)
      add(:channel_id, :string, null: false)
      add(:author_id, :string, null: false)
      add(:content, :text)
      add(:timestamp, :utc_datetime)

      timestamps()
    end

    create(unique_index(:messages, [:message_id]))
  end
end
