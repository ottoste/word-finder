defmodule WordFinder do
	def main do
    get_word_from_user |> display_word_count
  end

  def display_word_count(word) do
  	File.read("text.txt")
    |> make_list_of_strings
    |> get_count_of_word_appearance(word)
    |> print_the_word_count
  end

  def make_list_of_strings({:ok, contents}) do
  	String.downcase(contents)
		|>String.codepoints
		|>Enum.filter(fn c -> c =~ ~r/[a-z]/ or c =~ ~r/[ ]/ end)
		|>List.to_string
		|>String.split(" ")
  end

  def make_list_of_strings({:error, _}) do
  	IO.puts("Oops something went wrong")
  end

  def get_word_from_user do
  	IO.gets("What is the word you are looking for?")
  	|>String.strip
  end

	def get_count_of_word_appearance(list_of_first_string, target_word) do
		Enum.count(list_of_first_string, fn(x) -> x == (target_word) end)
	end

	def print_the_word_count(word) do
		IO.puts("The word has been found #{word} times")
	end
end
