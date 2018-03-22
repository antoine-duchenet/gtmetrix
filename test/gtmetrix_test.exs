defmodule GTmetrixTest do
  use ExUnit.Case
  doctest GTmetrix
end

defmodule GTmetrixTest.Test do
  use ExUnit.Case
  doctest GTmetrix

  test "Start a test" do
    %{"credits_left" => credits_left, "poll_state_url" => poll_state_url, "test_id" => test_id} =
      GTmetrix.Test.start("www.google.fr")

    assert(is_integer(credits_left))
    assert(is_bitstring(poll_state_url))
    assert(is_bitstring(test_id))
  end

  test "Fetch test results" do
    test = GTmetrix.Test.start("www.google.fr")
    GTmetrix.Test.fetch_results(test)
    %{"test_id" => test_id} = test
    GTmetrix.Test.fetch_results(test_id)
  end
end
