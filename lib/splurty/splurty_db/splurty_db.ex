defmodule Splurty.SplurtyDb do
  alias Splurty.Repo
  alias Splurty.SplurtyDB.Quote

  def list_quotes do
    Repo.all(Quote)
  end
end
