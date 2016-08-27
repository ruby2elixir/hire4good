defmodule Hire4Good.LibrariesIO do
  alias Hire4Good.Project

  def collect(github_name, type) when type in ["contributions", "repositories"] do
    github_name
    |> collect_pages(type)
    |> Enum.map(&parse/1)
    |> List.flatten
  end

  def collect_pages(name, type) do
    collect_pages([], 1, name, type)
  end
  def collect_pages(pages, nil, _name, _type) do
    pages
  end
  def collect_pages(pages, next_num, name, type) do
    {:ok, page} = fetch(name, next_num, type)
    pages = [page | pages]
    collect_pages(pages, next_page_num(page), name, type)
  end

  def libraries_url(name, page, type) do
    "https://libraries.io/github/#{name}/#{type}?page=#{page}"
  end

  def fetch(name, page, type) do
    IO.puts "fetching page #{page} for #{name}..."
    case HTTPoison.get(libraries_url(name, page, type)) do
      {:ok,  %HTTPoison.Response{body: body} } -> {:ok, body}
      {:error, res } -> {:error, res}
    end
  end

  def parse(html) do
    Floki.find(html, ".project")
    |> Enum.map(&parse_project/1)
  end

  def next_page_num(html) do
    url = Floki.find(html, "a[rel=next]")
    |> Floki.attribute("href")
    |> List.first

    case url do
      nil -> nil
      url -> Regex.run(~r/\?page=(\d+)/, url) |> List.last |> String.to_integer
    end
  end

  def parse_project(el) do
    %Project{
      url:   parse_url(el),
      desc:  parse_desc(el),
      lang:  parse_lang(el),
      stars: parse_stars(el),
    }
  end

  def parse_url(el),  do: "https://github.com/" <> (Floki.find(el, "a") |> List. first |> Floki.text)
  def parse_desc(el), do: Floki.find(el, "div") |> Enum.at(1) |> Floki.text |> String.trim
  def parse_lang(el) do
    Floki.find(el, "a[href*=languages]")
    |> Enum.map(fn(x)-> Floki.text(x) end)
    |> List.first
  end
  def parse_stars(el) do
    txt = Floki.find(el, "small") |> Floki.text
    case Regex.run(~r/(\d+ stars)/, txt) do
      nil -> 0
      r   -> r |> List.first |> String.replace(" stars", "") |> String.to_integer
    end
  end
end
