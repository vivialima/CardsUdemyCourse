defmodule Cards do
@moduledoc """
 Provides methods for creating and handling a deck of cards
"""
  def hello do
    "Hi Vivia!"
  end

  @doc """
    Returns a list of strings representing a deck of playng cards
  """
  def create_deck do 
   values = ["Ace","two","trhee","Four","Five"]
   suits = ["Spades","Clubs","Hearts","Diamants"]
   for value <- values, suit <- suits  do
      "#{value} of #{suit}"
   end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end  

  @doc """
    Determines if a deck constains a given card
  
  ## Examples

    iex> deck = Cards.create_deck
    iex> Cards.contains?(deck, "Ace of Spades")
    true

  """
  def contains?(deck, card) do
    Enum.member?(deck,  card)
  end

  @doc """
    Divides `hand_size`

  ## Examples

    iex(1)> deck = Cards.create_deck
    iex(2)> {hand,deck} = Cards.deal(deck,1)
    iex(3)> hand
    ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  #erlang pra salvar no arquivo
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename,binary)
  end

  def load_old(filename) do
    {status,binary} = File.read(filename)
    case status do
      :ok -> :erlang.binary_to_term binary
      :error -> "Esse arquivo não existe"
    end
  end 

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "Esse arquivo não existe"
    end
  end 

  def create_hand(hand_size) do
      #deck = Cards.create_deck
      #deck = Cards.shuffle
      #hand = Cards.deal(deck, hand_size)
      Cards.create_deck
      |> Cards.shuffle
      |> Cards.deal(hand_size)
  end
end
