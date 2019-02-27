defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    # strand |> String.graphemes |> Enum.count(& &1 == [nucleotide])
    # len = strand |> String.split([nucleotide]) |> length()
    # total = len - 1
      # require IEx; IEx.pry()

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
  end
end

NucleotideCount.count('CCCFACSA', ?A)
