defmodule Cards do
  @moduledoc """
  Provides functions for creating and handeling a deck of cards.
  """

  @doc """
  Returns a list of string representing play cards.
  ## Examples

      iex> Cards.create_deck
      ["Ace","Two","Three"]

  """
  def create_deck do
    values = ["Ace","Two","Three","Four","Five", "Six", "Seven"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
     for suit <- suits, card <- values do
        "#{card} of #{suit}"
    end
  end

@doc """
Divides the deck of cards in to a hand and reminder of the deck.
The `hand_size` argument indicates how many cards should be in the hand.
## Examples

    iex> {hand, deck} = Cards.create_deck|>Cards.deal(1)
    iex> hand
"""
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

@doc """
Shuffles the deck of cards in a random order.
The `deck` argument is the original deck of card created by [`Cards.create_deck`](#create_deck/0)

##Examples
      iex> shuffled = Cards.create_deck|>Cards.shuffle
"""
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Check whether a card exists in the deck.
  The `card` argument compared against the `deck` argument.

  Returns `true` or `false`
  ##Examples
        iex>Cards.create_deck|>Cards.contains?("Ace of Spades")
        iex>true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Saves the deck to a file store specicfied by `file` argument.

  Returns `:ok`
  """
  def save(deck,file) do
    binary = :erlang.term_to_binary(deck)
    File.write(file, binary)
  end

  @doc """
  Loads the saved deck of cards from a file store specicfied by `file` argument.

  Returns `deck` or `File does not exist`
  """

  def load(file) do
    case File.read(file) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, :enoent} -> "File does not exist"
    end

  end

@doc """
Creats a hand based on a hand size from a deck which is shuffled.

##Examples

      iex>Cards.create_hand|>Cards.shuffle\>Cards.deal(1)
"""
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
