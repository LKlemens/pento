defmodule Pento.Questions.FAQ do
  use Ecto.Schema
  import Ecto.Changeset

  schema "faqs" do
    field :answer, :string
    field :question, :string
    field :vote, :integer

    timestamps()
  end

  @doc false
  def changeset(faq, attrs) do
    faq
    |> cast(attrs, [:question, :answer, :vote])
    |> validate_required([:question, :answer, :vote])
  end
end
