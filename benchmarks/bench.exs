unless PrimalEx.n_primes(3) == PrimalEx.e_n_primes(3) and
         PrimalEx.n_primes(3) == PrimalEx.e_n_primes_stream(3) do
  raise "Results not the same"
end

inputs = %{
  "small" => 10,
  "medium" => 100,
  "large" => 1000
}

Benchee.run(
  %{
    "NIF" => fn num -> PrimalEx.n_primes(num) end,
    "elixir" => fn num -> PrimalEx.e_n_primes(num) end,
    "elixir stream" => fn num -> PrimalEx.e_n_primes_stream(num) end
  },
  time: 10,
  inputs: inputs
)

# Operating System: Linux
# CPU Information: Intel(R) Core(TM) i7-8550U CPU @ 1.80GHz
# Number of Available Cores: 8
# Available memory: 15.39 GB
# Elixir 1.8.1
# Erlang 20.2

# Benchmark suite executing with the following configuration:
# warmup: 2 s
# time: 10 s
# memory time: 0 ns
# parallel: 1
# inputs: large, medium, small
# Estimated total run time: 1.80 min

# Benchmarking NIF with input large...
# Benchmarking NIF with input medium...
# Benchmarking NIF with input small...
# Benchmarking elixir with input large...
# Benchmarking elixir with input medium...
# Benchmarking elixir with input small...
# Benchmarking elixir stream with input large...
# Benchmarking elixir stream with input medium...
# Benchmarking elixir stream with input small...

###### With input small #####
# Name                    ips        average  deviation         median         99th %
# elixir             36586.30      0.0273 ms    ±62.68%      0.0260 ms      0.0475 ms
# NIF                  261.90        3.82 ms     ±8.86%        3.69 ms        5.25 ms
# elixir stream         16.63       60.13 ms     ±0.62%       60.00 ms       61.85 ms

# Comparison:
# elixir             36586.30
# NIF                  261.90 - 139.70x slower
# elixir stream         16.63 - 2200.05x slower

###### With input medium #####
# Name                    ips        average  deviation         median         99th %
# NIF                  271.39        3.69 ms     ±5.09%        3.64 ms        4.52 ms
# elixir               131.52        7.60 ms     ±3.79%        7.54 ms        8.76 ms
# elixir stream          0.92     1086.08 ms     ±0.22%     1085.04 ms     1091.96 ms

# Comparison:
# NIF                  271.39
# elixir               131.52 - 2.06x slower
# elixir stream          0.92 - 294.75x slower

###### With input large #####
# Name                    ips        average  deviation         median         99th %
# NIF                  264.20      0.00379 s     ±8.74%      0.00369 s      0.00520 s
# elixir                 0.62         1.62 s     ±3.04%         1.62 s         1.68 s
# elixir stream        0.0625        16.01 s     ±0.00%        16.01 s        16.01 s

# Comparison:
# NIF                  264.20
# elixir                 0.62 - 427.29x slower
# elixir stream        0.0625 - 4229.03x slower
