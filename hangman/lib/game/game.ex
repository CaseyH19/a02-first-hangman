defmodule Hangman.Game do

  #initializes a new Game
  def new_game() do
    new_word = gen_word()
    %Hangman.Tally{letters: new_word}
  end

  def gen_word() do
    word = Dictionary.random_word()
    |> String.codepoints()
  end

end
