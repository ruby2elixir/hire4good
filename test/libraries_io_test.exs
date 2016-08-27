defmodule Hire4Good.LibrariesIO.Test do
  use ExUnit.Case
  doctest Hire4Good.LibrariesIO
  alias Hire4Good.LibrariesIO

  def fixture(f) do
    File.read!("test/fixtures/#{f}")
  end

  describe "parse" do
    test "works" do
      page = fixture("page1.html")
      res = LibrariesIO.parse(page)
      assert length(res) > 0
      el = Enum.at(res, 0)
      assert el.url == "https://github.com/dawanda/sheriff"
      assert el.desc == "Web-based server monitoring and reporting, Scout-compatible."
      assert el.lang == "Ruby"
      assert el.stars == 37
    end
  end

  describe "next_page_num" do
    test "works" do
      page = fixture("page1.html")
      assert LibrariesIO.next_page_num(page) == 2

      page = fixture("page4.html")
      assert LibrariesIO.next_page_num(page) == nil
    end
  end
end
