defmodule Aoc2022.Day1 do
  def example_input do
    "lib/day_1/example_input.txt"
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(&Integer.parse/1)
  end

  def input do
    "lib/day_1/input.txt"
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(&Integer.parse/1)
  end

  def part_1_example() do
    do_part_1(example_input())
  end

  def part_1() do
    do_part_1(input())
  end

  defp do_part_1(input, window_size \\ 1) do
    input
        |>Enum.reduce(
          %{previous: nil, increases: 0, window: []},
         fn current_number, %{previous: previous, increases: increases, window: windows} = state ->
          windows  Enum.map(windows, &[current_number | &1]) ++ [[current_number]]

            [closing_window | rest_windows] - new_windows = Enum.map(windows, fn window ->
              Enum.take([current_number | window], window_size)
            end)

            closing_window_sum = Enum.sum(closing_window)
      if previous do
        if current_number > previous do
          %{previous: current_number, increases: increases + 1}
        else
          %{previous: current_number, increases: increases}
        end
      else
        %{previous: current_number, increases: 0}
      end

    end)
    |> Map.get(:increases)
  end
end
