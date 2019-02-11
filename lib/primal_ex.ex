defmodule PrimalEx do
  alias PrimalEx.NativePrime

  def primes(x) do
    NativePrime.primes(x)
  end

  def primes(x, y) when x > y do
    {:error, "The first arugment cannot be greater than the second"}
  end

  def primes(x, y) do
    NativePrime.primes(x, y)
  end

  def n_primes(x) do
    NativePrime.n_primes(x)
  end

  def n_primes(x, y) when x > y do
    {:error, "The first arugment cannot be greater than the second"}
  end

  def n_primes(x, y) do
    NativePrime.n_primes(x, y)
  end

  def nth_prime(x) do
    NativePrime.nth_prime(x)
  end

  def count_primes(x) do
    NativePrime.count_primes(x)
  end

  def is_prime(x) do
    NativePrime.is_prime(x)
  end

  def e_n_primes_stream(n) do
    result = Stream.interval(1) |> Stream.drop(2) |> Stream.filter(&e_is_prime/1) |> Enum.take(n)
    {:ok, result}
  end

  def e_n_primes(n), do: {:ok, e_prime(n, [], 2)}
  def e_prime(n, acc, _num) when length(acc) == n, do: Enum.reverse(acc)

  def e_prime(n, acc, num) do
    case e_is_prime(num) do
      true -> e_prime(n, [num | acc], num + 1)
      false -> e_prime(n, acc, num + 1)
    end
  end

  def e_is_prime(x), do: 2..x |> Enum.filter(fn a -> rem(x, a) == 0 end) |> length() == 1
end
