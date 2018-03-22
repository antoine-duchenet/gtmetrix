defmodule GTmetrix do
  @moduledoc """
  Documentation for GTmetrix.
  """

  use HTTPoison.Base

  defp process_url(url), do: Application.get_env(:gtmetrix, :endpoint, "https://gtmetrix.com/api/0.1") <> url
  defp process_request_options(_), do: [hackney: [basic_auth: Application.get_env(:gtmetrix, :basic_auth)]]
end

defmodule GTmetrix.Test do
  def start(url) do
    body = {:form, [url: url]}
    case GTmetrix.post("/test", body , []) do
      {:ok, response} -> Poison.decode!(response.body)
      {_, response} -> response
    end
  end

  def fetch_results(%{"test_id" => test_id}) do
    fetch_results(test_id)
  end

  def fetch_results(test_id) do
    case GTmetrix.get("/test/" <> test_id , []) do
      {:ok, response} -> Poison.decode!(response.body)
      {_, response} -> response
    end
  end
end
