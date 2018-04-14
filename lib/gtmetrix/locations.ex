defmodule GTmetrix.Browsers do
  def list() do
    case GTmetrix.get("/locations", []) do
      {:ok, response} -> Poison.decode!(response.body)
      {_, response} -> response
    end
  end
end