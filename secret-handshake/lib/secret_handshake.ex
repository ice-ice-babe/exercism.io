use Bitwise

defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(num) do
    [
      if((num &&& 0b1) != 0, do: "wink"),
      if((num &&& 0b10) != 0, do: "double blink"),
      if((num &&& 0b100) != 0, do: "close your eyes"),
      if((num &&& 0b1000) != 0, do: "jump")
    ]
    |> Enum.reject(&is_nil/1)
    |> reverse?(num)
  end

  defp reverse?(list, num) do
    if((num &&& 0b10000) != 0, do: Enum.reverse(list), else: list)
  end
end
