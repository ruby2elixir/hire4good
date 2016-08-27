defmodule Hire4Good do
  def contributions(name) do
    Hire4Good.Contributions.collect(name)
  end

  def repositories(name) do
    Hire4Good.Repositories.collect(name)
  end
end
