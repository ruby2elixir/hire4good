defmodule Hire4Good.Contributions.Test do
  use ExUnit.Case
  doctest Hire4Good.Contributions
  alias Hire4Good.Contributions

  def fixture(f) do
    File.read!("test/fixtures/#{f}")
  end

  describe "collect" do
  end

  describe "parse" do
    test "works" do
      page = fixture("page1.html")
      res = Contributions.parse(page) |> IO.inspect
      assert length(res) > 0
      el = Enum.at(res, 0)
      assert el.url == "https://github.com/dawanda/sheriff"
      assert el.desc == "Web-based server monitoring and reporting, Scout-compatible."
      assert el.lang == "Ruby"
      assert el.stars == 37
    end
  end
end
