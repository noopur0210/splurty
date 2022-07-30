defmodule SplurtyWeb.QuoteController do
  use SplurtyWeb, :controller

  alias Splurty.SplurtyDb
  alias Splurty.SplurtyDB.Quote
  alias Splurty.Repo

  def homepage(conn, _params) do
    render(conn, "homepage.html")
  end

  def index(conn, _params) do
    quotes = SplurtyDb.list_quotes()
    render(conn, "index.html", quotes: quotes)
  end

  def new(conn, _params) do
    changeset = SplurtyDb.change_quote(%Quote{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"quote" => quote_params}) do
   case SplurtyDb.create_quote(quote_params) do
      {:ok, _quote} ->
        conn
        |> put_flash(:info, "Quote created successfully")
        |> redirect(to: Routes.quote_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
