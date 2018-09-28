defmodule HangmanTest do
  use ExUnit.Case
  doctest Hangman

  test "Check Initial Data" do
    assert Hangman.new_game().game_state == :initializing
    assert Hangman.new_game().turns_left == 7
  end

  test "right guess" do
    game = %Hangman.Tally{
      game_state: :initializing,
      last_guess: "",
      letters: ["m", "a", "t"],
      used: [],
      turns_left: 7
    }
    assert {%Hangman.Tally{game_state: :good_guess}, tally} = Hangman.make_move(game, "m")
  end

  test "bad guess" do
    game = %Hangman.Tally{
      game_state: :initializing,
      last_guess: "",
      letters: ["r", "e", "f"],
      used: [],
      turns_left: 7
    }
    assert {%Hangman.Tally{game_state: :bad_guess}, tally} = Hangman.make_move(game, "w")
  end

  test "repeat letter" do
    game = %Hangman.Tally{
      game_state: :bad_guess,
      last_guess: "a",
      letters: ["j","k"],
      used: ["a"],
      turns_left: 7

    }
    assert {%Hangman.Tally{game_state: :already_used}, tally} = Hangman.make_move(game, "a")
  end

  test "winner" do
    game = %Hangman.Tally{
      game_state: :good_guess,
      last_guess: "s",
      letters: ["j","u","m","p"],
      used: ["j", "u", "m"],
      turns_left: 7
    }
    assert {%Hangman.Tally{game_state: :good_guess}, %Hangman.Tally{game_state: :won}} = Hangman.make_move(game, "p")
  end

  test "loser" do
    game = %Hangman.Tally{
      game_state: :bad_guess,
      last_guess: "x",
      letters: ["h", "i"],
      used: ["y"],
      turns_left: 1
    }
    assert {%Hangman.Tally{game_state: :bad_guess}, %Hangman.Tally{game_state: :lost}} = Hangman.make_move(game, "q")
  end

end
