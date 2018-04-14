defmodule GTmetrix.Browsers do
  def list() do
    case GTmetrix.get("/browsers", []) do
      {:ok, response} -> Poison.decode!(response.body)
      {_, response} -> response
    end
  end

  def details(browser_id) do
    case GTmetrix.get("/browsers/" <> browser_id, []) do
      {:ok, response} -> Poison.decode!(response.body)
      {_, response} -> response
    end
  end
end