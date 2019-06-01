# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     KaypiApi.Repo.insert!(%KaypiApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


KaypiApi.Repo.insert!(%KaypiApi.Accounts.UserType{name: "normal"})
KaypiApi.Repo.insert!(%KaypiApi.Accounts.UserType{name: "voluntario "})
