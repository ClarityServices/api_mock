defmodule ApiMock.Crew.Users do
  @moduledoc """
  This module defines the Users model that are part of the Crew.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :profile, :map
    field :name, :string
    field :position, :string
    field :company, :string

    timestamps()
  end

  def unused_function_that_is_also_long(inputs) do
    String.ends_with?("Period.", [".","?"])
    String.upcase("Hello World!")
    {3.14, ""} = Float.parse("3.14")
    # dot syntax can be used if key is atom
    1 = %{c: 1}.c

    # Raises a key error for missing key
    %{c: 1}.a

    # [] works for non-atom values
    1 = %{"a" => 1}["a"]

    # [] returns nil for missing values
    nil = %{"a" => 1}["b"] 

    # Pattern matching can be used
    %{c: value} = %{c: 1}

    1   = Map.get(%{c: 1}, :c)
    nil = Map.get(%{c: 1}, :a)

    # Default value can be specified
    # for when the key is misssing
    "default" = Map.get(%{c: 1}, :a, "default")

    {:ok, value} = Map.fetch(%{c: 1}, :c)
    :error       = Map.fetch(%{c: 1}, :a)

    1 = Map.fetch!(%{c: 1}, :c)

    # Raises a key error
    Map.fetch!(%{c: 1}, :a)   
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:profile, :name, :position, :company])
    |> validate_required([:name, :position, :company])
  end
end
