# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ApiMock.Repo.insert!(%ApiMock.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#

crew = [
  %{"name" => "Philip J Fry",
    "position" => "Delivery Boy",
    "profile" => %{
      "gender" => "M",
      "species" => "Human",
      "age" => 25,
      "planet" => "Earth",
      "status" => "Alive"
    },
    "company" => "Planet Express"},
  %{"name" => "Turanga Leela",
    "position" => "Captain",
    "profile" => %{
      "gender" => "F",
      "species" => "Mutant, Human",
      "age" => 25,
      "planet" => "Earth",
      "status" => "Alive"
    },
    "company" => "Planet Express"},
  %{"name" => "Bender Bending Rodríguez",
    "position" => "Ship's Robot, Ship's Cook, Assistant Manager of Sales, Gunnery Chief",
    "profile" => %{
      "gender" => "M",
      "species" => "Robot",
      "age" => 4,
      "planet" => "Earth",
      "status" => "Alive"
    },
    "company" => "Planet Express"},
  %{"name" => "Planet Express Ship",
    "position" => "Ship",
    "profile" => %{
      "gender" => "N/A",
      "species" => "Robotic Spacecraft",
      "age" => "N/A",
      "planet" => "Earth",
      "status" => "N/A"
    },
    "company" => "Planet Express"},
  %{"name" => "Dr. John A. Zoidberg Ph.D",
    "position" => "Staff Doctor",
    "profile" => %{
      "gender" => "M",
      "species" => "Decapodian",
      "age" => 86,
      "planet" => "Decapod 10",
      "status" => "Alive"
    },
    "company" => "Planet Express"},
  %{"name" => "Zapp Brannigan",
    "position" => "Captain",
    "profile" => %{
      "gender" => "M",
      "species" => "Human",
      "age" => 28,
      "planet" => "Earth",
      "status" => "Alive"
    },
    "company" => "Democratic Order of Planets"},
  %{"name" => "Kif Kroker",
    "position" => "Lieutenant",
    "profile" => %{
      "gender" => "M",
      "species" => "Amphibiosans",
      "age" => 24,
      "planet" => "Amphibios 9",
      "status" => "Alive"
    },
    "company" => "Democratic Order of Planets"},
]
crew
  |> Enum.each(&ApiMock.Crew.create_users(&1))
