defmodule Hire4Good.Analyzer do
  alias Hire4Good.LibrariesIO
  def analyse(name, type) when type in ["contributions", "repositories"] do
    projects = LibrariesIO.collect(name, type)
    analyse(name, projects)
  end

  def analyse(name, projects) when is_list(projects) do
    grouped = grouped(projects)
    []
    |> add("*****************************")
    |> add("Analysis for:       #{name}")
    |> add("Number of projects: #{length(projects)}")
    |> add("Languages:          #{languages(grouped)}")
    |> add("Overview")
    |> add(lang_overview(grouped))
    |> add("*****************************")
    |> Enum.reverse
    |> Enum.join("\n")
    |> IO.puts
  end

  defp add(lines, line), do: [line | lines] |> List.flatten

  defp grouped(projects) do
    projects
    |> Enum.group_by(fn(x)-> x.lang end)
  end

  def languages(m), do: (Map.keys(m) -- [nil]) |> Enum.join(", ")

  def lang_overview(grouped) do
    grouped
    |> Enum.map(fn({lang, projects})-> [lang, length(projects)] end)
    |> Enum.sort_by(fn([lang, count])-> count  end)
    |> Enum.map(fn([l, c])-> "- #{l}: #{c}" end)
  end
end
