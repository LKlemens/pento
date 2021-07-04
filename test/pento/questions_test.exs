defmodule Pento.QuestionsTest do
  use Pento.DataCase

  alias Pento.Questions

  describe "faqs" do
    alias Pento.Questions.FAQ

    @valid_attrs %{answer: "some answer", question: "some question", vote: 42}
    @update_attrs %{answer: "some updated answer", question: "some updated question", vote: 43}
    @invalid_attrs %{answer: nil, question: nil, vote: nil}

    def faq_fixture(attrs \\ %{}) do
      {:ok, faq} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Questions.create_faq()

      faq
    end

    test "list_faqs/0 returns all faqs" do
      faq = faq_fixture()
      assert Questions.list_faqs() == [faq]
    end

    test "get_faq!/1 returns the faq with given id" do
      faq = faq_fixture()
      assert Questions.get_faq!(faq.id) == faq
    end

    test "create_faq/1 with valid data creates a faq" do
      assert {:ok, %FAQ{} = faq} = Questions.create_faq(@valid_attrs)
      assert faq.answer == "some answer"
      assert faq.question == "some question"
      assert faq.vote == 42
    end

    test "create_faq/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Questions.create_faq(@invalid_attrs)
    end

    test "update_faq/2 with valid data updates the faq" do
      faq = faq_fixture()
      assert {:ok, %FAQ{} = faq} = Questions.update_faq(faq, @update_attrs)
      assert faq.answer == "some updated answer"
      assert faq.question == "some updated question"
      assert faq.vote == 43
    end

    test "update_faq/2 with invalid data returns error changeset" do
      faq = faq_fixture()
      assert {:error, %Ecto.Changeset{}} = Questions.update_faq(faq, @invalid_attrs)
      assert faq == Questions.get_faq!(faq.id)
    end

    test "delete_faq/1 deletes the faq" do
      faq = faq_fixture()
      assert {:ok, %FAQ{}} = Questions.delete_faq(faq)
      assert_raise Ecto.NoResultsError, fn -> Questions.get_faq!(faq.id) end
    end

    test "change_faq/1 returns a faq changeset" do
      faq = faq_fixture()
      assert %Ecto.Changeset{} = Questions.change_faq(faq)
    end
  end
end
