defmodule ApiMock.Crew do
  @moduledoc """
  The Crew context.
  """

  alias ApiMock.Crew.Users

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%Users{}, ...]

  """
  def list_users do
    list_users_json
  end

  @doc """
  Gets a single users.

  Raises `Ecto.NoResultsError` if the Users does not exist.

  ## Examples

      iex> get_users!(123)
      %Users{}

      iex> get_users!(456)
      ** (Ecto.NoResultsError)

  """
  def get_users!(id) do
    list_users
      |> Enum.find_value({:error, :not_found}, fn u ->
        if u[:id] == id, do: {:ok, u}
      end)
  end

  @doc """
  Creates a users.

  ## Examples

      iex> create_users(%{field: value})
      {:ok, %Users{}}

      iex> create_users(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_users(attrs \\ %{}) do
    %Users{}
    |> Users.changeset(attrs)
  end

  def list_users_json() do
    [
      %{name: "Philip J Fry",
        position: "Delivery Boy",
        id: "3aa03fb8-57c2-4926-8ab5-51459b477fd1",
        profile: %{
          gender: "M",
          species: "Human",
          age: 25,
          planet: "Earth",
          status: "Alive"
        },
        company: "Planet Express"},
      %{name: "Turanga Leela",
        position: "Captain",
        id: "5b829f59-ee8d-481e-9980-5aa8f9e46953",
        profile: %{
          gender: "F",
          species: "Mutant, Human",
          age: 25,
          planet: "Earth",
          status: "Alive"
        },
        company: "Planet Express"},
      %{name: "Bender Bending Rodríguez",
        position: "Ship's Robot, Ship's Cook, Assistant Manager of Sales, Gunnery Chief",
        id: "04921ff5-ccfe-40b1-9c92-1a369ea116a6",
        profile: %{
          gender: "M",
          species: "Robot",
          age: 4,
          planet: "Earth",
          status: "Alive"
        },
        company: "Planet Express"},
      %{name: "Planet Express Ship",
        position: "Ship",
        id: "33190659-6e73-4162-80ff-563cb2b256e1",
        profile: %{
          gender: "N/A",
          species: "Robotic Spacecraft",
          age: "N/A",
          planet: "Earth",
          status: "N/A"
        },
        company: "Planet Express"},
      %{name: "Dr. John A. Zoidberg Ph.D",
        position: "Staff Doctor",
        id: "88b5b4a0-c795-48a7-a6a2-5b344c760a94",
        profile: %{
          gender: "M",
          species: "Decapodian",
          age: 86,
          planet: "Decapod 10",
          status: "Alive",
        },
        company: "Planet Express"},
      %{name: "Zapp Brannigan",
        position: "Captain",
        id: "bc1e90a7-0aa5-47a9-8a64-98d4f0f2ade8",
        profile: %{
          gender: "M",
          species: "Human",
          age: 28,
          planet: "Earth",
          status: "Alive"
        },
        company: "Democratic Order of Planets"},
      %{name: "Kif Kroker",
        position: "Lieutenant",
        id: "d310ae2a-d301-497a-9956-e1394521ac26",
        profile: %{
          gender: "M",
          species: "Amphibiosans",
          age: 24,
          planet: "Amphibios 9",
          status: "Alive"
        },
        company: "Democratic Order of Planets"}
    ]
  end
end
