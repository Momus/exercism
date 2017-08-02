## Top Level Documentation for Rubocop
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
    ## Skiping  all even numbers
    odds = (3..limit).step(2).to_a
    until odds.size.zero?
      last_prime = odds.shift
      odds.each_index do |n|
        unless odds[n].nil?
          odds.delete_at(n) if (odds[n] % last_prime).zero?
        end
      end
      @primes << last_prime
    end
  end
end
