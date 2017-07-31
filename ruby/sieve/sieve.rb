## Top Level Documentation for Rubocop
class Sieve
  attr_reader :primes

  def initialize(limit)
    @primes = limit < 2 ? [] : sieve(limit)
  end

  private

  def sieve(limit)
    possible_primes = (2..limit).to_a
    possible_primes
  end

  def pop_multiple(target, numeric_array)
    numeric_arrray
  end
end
