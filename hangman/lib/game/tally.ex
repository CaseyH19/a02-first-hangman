defmodule Hangman.Tally do

  defstruct(
    game_state: :initialized,
    turns_left: 7,
    letters: [],
    used: [],
    last_guess: '',
  )

  #returns the current game-card
  def tally(game) do
    game
  end

end
