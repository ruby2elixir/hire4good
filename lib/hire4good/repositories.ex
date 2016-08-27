defmodule Hire4Good.Repositories do
  alias Hire4Good.LibrariesIO

  def collect(github_name) do
    LibrariesIO.collect(github_name, "repositories")
  end
end
