defmodule Hangman.Guess do

  #initializes a new Game
  def make_move(game, guess) do
    g1 = repeat(Enum.member?(game.used, guess), game, guess)
  end

  def repeat(false, game, guess) do
   %{game | used: [guess | game.used]}
  end

  def repeat(true, game, _guess) do
    %{game | game_state: :already_used}
  end

end
