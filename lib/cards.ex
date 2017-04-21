defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello
      :world

  """
  def create_deck do
    values = ["Ace","Two","Three","Four","Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
     for suit <- suits, card <- values do
        "#{card} of #{suit}"
    end
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def save(deck,file) do
    binary = :erlang.term_to_binary(deck)
    File.write(file, binary)
  end

  def load(file) do
    case File.read(file) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, :enoent} -> "File does not exist"
    end

  end

end
