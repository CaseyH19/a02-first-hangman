defmodule HangmanTest do
  use ExUnit.Case
  doctest Hangman

  test "Check Initial Data" do
    assert Hangman.new_game().game_state == :initialized
    assert Hangman.new_game().turns_left == 7
  end

  # test "numb 2" do
  #   assert Hangman.make_move()
  # end
end
