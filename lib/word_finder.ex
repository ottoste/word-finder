defmodule WordFinder do
	
  def main([file]) do
    get_word_from_user |> display_word_count(file)
  end

  def main(_) do
    IO.puts("Give one file name as an argument")
  end

  def display_word_count(word, file) do
  	File.read(file)
    |> make_list_of_strings
    |> get_count_of_word_appearance(word)
    |> print_the_word_count
  end

  def make_list_of_strings({:ok, contents}) do
  	String.downcase(contents)
		|> String.codepoints
		|> Enum.filter(fn c -> c =~ ~r/[a-z]/ or c =~ ~r/[ ]/ end)
		|> List.to_string
		|> String.split(" ")
  end

  def make_list_of_strings({:error, _}) do
  	IO.puts("File not found")
    System.halt(1)
  end

  def get_word_from_user do
  	IO.gets("What is the word you are looking for?")
  	|> String.strip
  end

	def get_count_of_word_appearance(list_of_first_string, target_word) do
		Enum.count(list_of_first_string, fn(x) -> x == (target_word) end)
	end

	def print_the_word_count(word) do
		IO.puts("The word has been found #{word} times")
	end
end
