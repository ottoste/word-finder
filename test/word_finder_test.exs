defmodule WordFinderTest do
  use ExUnit.Case
  doctest WordFinder


  test "makes list of first string" do
    assert WordFinder.make_list_of_string("hello world") == ["hello", "world"]
  end

  test "second word appears in first string once" do
    assert WordFinder.get_count_of_word_appearance(["hello", "world"], "world") == 1
  end

  test "second word appears in first string more than once" do
    assert WordFinder.get_count_of_word_appearance(["hello","world","hello","world","hello","world",], "world") == 3
  end


  test "second word appears in first string, but is a part of different word" do
  	assert WordFinder.get_count_of_word_appearance(["hand"], "and") == 0
  end

  test "need to remove uppercase letters from string" do
  	assert WordFinder.make_list_of_string("Hello") == ["hello"]
  end
  
  test "need to remove punctuation from string" do
  	assert WordFinder.make_list_of_string("Hello, world!") == ["hello","world"]
  end



  #Should test, if function gets a string from file here??

  # test "should make list based on text and count appearence of word" do
  # 	assert WordFinder.combine("The class teacher asks students to name an animal
  # 	 that begins with an “E”. One boy says, “Elephant.” Then the teacher asks for
  # 	 an animal that begins with a “T”. The same boy says, “Two elephants.” The 
  # 	 teacher sends the boy out of the class for bad behavior. After that she asks 
  # 	 for an animal beginning with “M”. The boy shouts from the other side of the 
  # 	 wall: “Maybe an elephant!”", "boy") == 4
  # end


end
