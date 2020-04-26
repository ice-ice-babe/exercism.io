defmodule RnaTranscription do
    @transcription %{ ?G => ?C, ?C => ?G, ?T => ?A, ?A => ?U }
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna |> Enum.map(&dna_to_rna/1)
  end

  defp dna_to_rna(nucleotide) do
    @transcription[nucleotide]
  end
end
