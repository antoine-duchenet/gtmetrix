defmodule GTmetrix do
  @moduledoc """
  Documentation for GTmetrix.
  """

  use HTTPoison.Base

  defp process_url(url),
    do: Application.get_env(:gtmetrix, :endpoint, "https://gtmetrix.com/api/0.1") <> url

  defp process_request_options(_),
    do: [hackney: [basic_auth: Application.get_env(:gtmetrix, :basic_auth)]]
end
