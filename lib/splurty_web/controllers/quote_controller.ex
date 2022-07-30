defmodule SplurtyWeb.QuoteController do
  use SplurtyWeb, :controller

  def homepage(conn, _params) do
    render(conn, "homepage.html")
  end
end
