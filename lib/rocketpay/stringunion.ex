defmodule Rocketpay.Strings do
  def join_string(string) do
    string =
      string
      |> String.split(" ")
      |> List.to_string()
      |> String.downcase()

    {:ok, %{result: string}}
  end
end
