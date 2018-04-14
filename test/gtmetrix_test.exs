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

  test "Fetch test state and supported resources" do
    test = GTmetrix.Test.start("www.google.fr")
    GTmetrix.Test.state(test)
    %{"test_id" => test_id} = test
    GTmetrix.Test.state(test_id)
    GTmetrix.Test.resource(test_id, "har")
    GTmetrix.Test.resource(test_id, "pagespeed")
    GTmetrix.Test.resource(test_id, "yslow")
  end

  test "List locations" do
    GTmetrix.Locations.list()
  end

  test "List browsers" do
    GTmetrix.Browsers.list()
  end

  test "Fetch browser details" do
    GTmetrix.Browsers.details(1)
  end

  test "Fetch accout status" do
    GTmetrix.Account.status()
  end
end
