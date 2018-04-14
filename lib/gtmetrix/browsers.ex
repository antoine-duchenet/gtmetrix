defmodule GTmetrix.Browsers do
  def list() do
    case GTmetrix.get("/browsers", []) do
      {:ok, response} -> Poison.decode!(response.body)
      {_, response} -> response
    end
  end

  def details(browser_id) when is_bitstring(browser_id) do 
    case GTmetrix.get("/browsers/" <> browser_id, []) do
      {:ok, response} -> Poison.decode!(response.body)
      {_, response} -> response
    end
  end

  def details(browser_id) when is_integer(browser_id) do 
    details(to_string(browser_id))
  end
end