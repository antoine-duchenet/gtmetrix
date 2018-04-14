defmodule GTmetrix.Test do
  def start(url) do
    body = {:form, [url: url]}

    case GTmetrix.post("/test", body, []) do
      {:ok, response} -> Poison.decode!(response.body)
      {_, response} -> response
    end
  end

  def state(%{"test_id" => test_id}) do
    state(test_id)
  end

  def state(test_id) do
    case GTmetrix.get("/test/" <> test_id, []) do
      {:ok, response} -> Poison.decode!(response.body)
      {_, response} -> response
    end
  end

  def resource(test_id, resource) do
    case GTmetrix.get("/test/" <> test_id <> "/" <> resource, []) do
      {:ok, response} -> Poison.decode!(response.body)
      {_, response} -> response
    end
  end
end
