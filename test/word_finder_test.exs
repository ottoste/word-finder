defmodule WordFinderTest do
  use ExUnit.Case
  doctest WordFinder


  test "makes list of first string" do
    assert WordFinder.make_list_of_strings({:ok, "hello world"}) == ["hello", "world"]
  end

  test "second word appears in first string once" do
    assert WordFinder.get_count_of_word_appearance(["hello", "world"], "world") == 1
  end

  test "second word appears in first string more than once" do
    assert WordFinder.get_count_of_word_appearance(["hello","world","world","world",], "world") == 3
  end


  test "second word appears in first string, but is a part of different word" do
  	assert WordFinder.get_count_of_word_appearance(["hand"], "and") == 0
  end

  test "need to remove uppercase letters from string" do
  	assert WordFinder.make_list_of_strings({:ok, "Hello"}) == ["hello"]
  end
  
  test "need to remove punctuation from string" do
  	assert WordFinder.make_list_of_strings({:ok, "Hello, world!"}) == ["hello","world"]
  end
end
