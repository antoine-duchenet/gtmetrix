defmodule GTmetrix.Account do
  def status() do
    case GTmetrix.get("/status", []) do
      {:ok, response} -> Poison.decode!(response.body)
      {_, response} -> response
    end
  end
end
