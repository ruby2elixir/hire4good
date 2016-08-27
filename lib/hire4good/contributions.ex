defmodule Hire4Good.Contributions do
  alias Hire4Good.LibrariesIO

  def collect(github_name) do
    LibrariesIO.collect(github_name, "contributions")
  end
end
