## Create a Sieve object containing an array of primes up to a limit.
class Sieve
  attr_reader :primes

  def initialize(limit)
    if limit < 2
      @primes = []
    else
      @primes = [2]
      sieve(limit)
    end
  end

  private

  def sieve(limit)
    odds = (3..limit).step(2).to_a
    until odds.size < Math.sqrt(limit)
      last_prime = odds.shift
      odds.each_index do |n|
        odds.delete_at(n) if (odds[n] % last_prime).zero?
      end
      @primes << last_prime
    end
    @primes.concat(odds)
  end
end

module BookKeeping
  VERSION = 1
end
