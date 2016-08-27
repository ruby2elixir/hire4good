defmodule Hire4Good.Analyzer do
  def analyse(name, projects) do
    []
    |> add("*****************************")
    |> add("Analysis for #{name}")
    |> add("Number projects: #{length(projects)}")
    |> add("Languages: #{ inspect grouped(projects)|> Map.keys}")
    |> add("*****************************")
    |> Enum.reverse
    |> Enum.join("\n")
    |> IO.puts
  end

  defp add(lines, line), do: [line | lines]

  defp grouped(projects) do
    projects
    |> Enum.group_by(fn(x)-> x.lang end)
  end
end
