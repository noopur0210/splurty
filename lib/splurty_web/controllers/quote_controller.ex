defmodule SplurtyWeb.QuoteController do
  use SplurtyWeb, :controller

  alias Splurty.SplurtyDb

  def homepage(conn, _params) do
    render(conn, "homepage.html")
  end

  def index(conn, _params) do
    quotes = SplurtyDb.list_quotes()
    render(conn, "index.html", quotes: quotes)
  end
end
