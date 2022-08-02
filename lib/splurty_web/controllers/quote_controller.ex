defmodule SplurtyWeb.QuoteController do
  use SplurtyWeb, :controller

  alias Splurty.SplurtyDb
  alias Splurty.SplurtyDB.Quote

  def homepage(conn, _params) do
    # q = SplurtyDb.get_random()
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

  def show(conn, %{"id" => id}) do
    q = SplurtyDb.get_quote!(id)
    render(conn, "show.html", quote: q)
  end

  def edit(conn, %{"id" => id}) do
    q = SplurtyDb.get_quote!(id)
    changeset = SplurtyDb.change_quote(q)
    render(conn, "edit.html", quote: q, changeset: changeset)
  end

  def update(conn, %{"id" => id, "quote" => quote_params}) do
    q = SplurtyDb.get_quote!(id)

    case SplurtyDb.update_quote(q, quote_params) do
      {:ok, _quote} ->
        conn
        |> put_flash(:info, "Quote updated successfully")
        |> redirect(to: Routes.quote_path(conn, :show, q))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", quote: q, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    q = SplurtyDb.get_quote!(id)

    {:ok, _quote} = SplurtyDb.delete_quote(q)

    conn
    |> put_flash(:info, "Quote deleted successfully")
    |> redirect(to: Routes.quote_path(conn, :index))
  end
end
