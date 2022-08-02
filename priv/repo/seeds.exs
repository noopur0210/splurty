# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Splurty.Repo.insert!(%Splurty.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Splurty.SplurtyDb

SplurtyDb.create_quote(%{
  saying: "Curiosity is the mother of invention"
})

SplurtyDb.create_quote(%{
  saying: "Do or do not, there's no try.",
  author: "Yoda"
})

SplurtyDb.create_quote(%{
  saying: "Sometimes I'll start a sentence, and I don't even know where it's going. I just hope I find it along the way.",
  author: "Michael Scott"
})
