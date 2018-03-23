defmodule GTmetrixTest do
  use ExUnit.Case
  doctest GTmetrix
end

defmodule GTmetrixTest.Test do
  use ExUnit.Case
  doctest GTmetrix

  test "Start a test with url" do
    :timer.sleep(10000)
    data = GTmetrix.Test.start("www.google.fr")
    assert_is_test(data)
  end

  test "Start a test with full options" do
    :timer.sleep(10000)
    data = GTmetrix.Test.start([url: "www.google.fr"])
    assert_is_test(data)
  end

  test "Fetch test results via id" do
    :timer.sleep(10000)
    %{"test_id" => test_id} = GTmetrix.Test.start("www.google.fr")
    data = GTmetrix.Test.fetch_results(test_id)
    assert_is_results(data)
  end

  test "Fetch test results via struct" do
    :timer.sleep(10000)
    test = GTmetrix.Test.start("www.google.fr")
    data = GTmetrix.Test.fetch_results(test)
    assert_is_results(data)
  end

  def assert_is_test(arg) do
    %{"credits_left" => credits_left, "poll_state_url" => poll_state_url, "test_id" => test_id} = arg
    assert(is_integer(credits_left))
    assert(is_bitstring(poll_state_url))
    assert(is_bitstring(test_id))
  end

  def assert_is_results(arg) do
    %{"error" => error, "state" => state} = arg
    assert(is_bitstring(error))
    assert(is_bitstring(state))
  end
end
