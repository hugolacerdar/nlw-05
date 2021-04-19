defmodule Inmana.Welcomer do
  # Receber um nome e uma idade do user
  # Se o user chamar banana e tiver idade 42, recebe uma mensagem especial
  # Se o user for maior de idade, recebe uma mensagem normal
  # Caso seja menor de idade, retornamos um erro
  # Temos que tratar o nome para entradas erradas, como BanAnA, "BaNaNa   \n"

  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "You are very special, banana"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome, #{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass, #{name}"}
  end
end
