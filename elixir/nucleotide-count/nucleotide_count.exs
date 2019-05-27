defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Example

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    if length(strand) == 0 do
      0
    else
      strand |> Enum.count(& &1 == nucleotide)
    end
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    # require IEx; IEx.pry
    # IO.inspect binding()
    # IO.puts(@nucleotides)
    #
    # TODO
    # Take it from here to turn into the key value pair
    # split the string into a list:
    # String.graphemes(strand)
    # |> Enum.map(fn char -> ... end)
  end
end

NucleotideCount.histogram('CCCFACSA')
