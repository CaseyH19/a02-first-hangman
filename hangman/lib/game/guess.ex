defmodule Hangman.Guess do

  #initializes a new Game
  def make_move(game, guess) do
    g = repeat(Enum.member?(game.used, guess), game, guess)
    g1 = Hangman.tally(g)
    {g, g1}
  end

  def repeat(false, game, guess) do
    g2 = %{game | used: [guess | game.used], last_guess: guess}
    good_bad(Enum.member?(g2.letters, guess), g2)
  end

  def repeat(true, game, guess) do
    %{game | game_state: :already_used, last_guess: guess}
  end



  def good_bad(true, game) do
    %{game | game_state: :good_guess}
  end

  def good_bad(false, game) do
    %{game | turns_left: (game.turns_left-1), game_state: :bad_guess}
  end

end
