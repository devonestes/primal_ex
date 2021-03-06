defmodule PrimalExTest do
  use ExUnit.Case

  test "primes/1 returns prime numbers less than x" do
    expected_result = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37]
    {:ok, result} = PrimalEx.primes(40)
    assert result == expected_result
  end

  test "primes/2 returns prime numbers great than x and less than y" do
    x = 100
    y = 120
    expected_result = [101, 103, 107, 109, 113]
    {:ok, result} = PrimalEx.primes(x, y)
    assert result == expected_result
  end

  test "n_primes/1 returns the first x prime numbers" do
    expected_result = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37]
    {:ok, result} = PrimalEx.n_primes(12)
    assert result == expected_result
  end

  test "n_primes/2 returns prime numbers the first x primes >=  y" do
    x = 10
    y = 1000
    expected_result = [1009, 1013, 1019, 1021, 1031, 1033, 1039, 1049, 1051, 1061]

    {:ok, result} = PrimalEx.n_primes(x, y)
    assert result == expected_result
  end

  test "nth_prime/1 returns nth prime" do
    n = 1_000_000
    expected_result = 15_485_863
    {:ok, result} = PrimalEx.nth_prime(n)
    assert result == expected_result
  end

  test "count_primes/1 count the primes below x" do
    n = 1_000_000
    expected_result = 78_498
    {:ok, result} = PrimalEx.count_primes(n)
    assert result == expected_result
  end

  test "is_prime/1 returns true if number is prime" do
    n = 3
    expected_result = true
    {:ok, result} = PrimalEx.is_prime(n)
    assert result == expected_result
  end

  test "is_prime/1 returns false if number is not prime" do
    n = 6
    expected_result = false
    {:ok, result} = PrimalEx.is_prime(n)
    assert result == expected_result
  end

end
