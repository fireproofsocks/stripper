defmodule Stripper.FileCase do
  @moduledoc """
  Interacts with files for fixtures
  """
  use ExUnit.CaseTemplate

  setup [:append_file_contents]

  defp append_file_contents(%{contents: tag}) do
    data =
      "test/support/files/#{tag}"
      |> File.read!()

    %{contents: data}
  end

  defp append_file_contents(context), do: context
end
