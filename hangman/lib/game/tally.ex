defmodule Hangman.Tally do

  defstruct(
    game_state: :initialized,
    turns_left: 7,
    letters: [],
    used: [],
    last_guess: ''
  )

  #returns the current game-card
  def tally(game) do
    determine_tally(game, game.letters, [])
  end

  def determine_tally(game, [h1 | t1], final) do
    determine_tally(game, t1, check(Enum.member?(game.used, h1), h1, final))
  end

  def determine_tally(game, [], final) do
    cond do
      (game.turns_left == 0) ->
        %{game | letters: Enum.reverse(final), game_state: :lost}

      (!Enum.member?(final, "_")) ->
        %{game | letters: Enum.reverse(final), game_state: :won}

      true ->
        %{game | letters: Enum.reverse(final)}
    end
  end

  def check(true, let, final) do
    [let | final]
  end

  def check(false, _let, final) do
    ["_" | final]
  end

end
