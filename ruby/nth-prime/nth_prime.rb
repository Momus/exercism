##  coding: utf-8

include Math
##  Object: Prime, methods: nth
class Prime
  ## There is no "zeroth prime" but ignoring that to get rid of
  ## troublesome array offsets.
  @primes = [0, 2, 3, 5] # , 7, 11, 13, 17, 19, 23]

  def self.nth(n)
    @primes[n] ||= prime(n)
  end

  ## updates the primes array to the nth prime and returns it.
  def self.prime(n)
    sieve(estimate(n))
    @primes[n]
  end

  ## Prime Number Therom provides an upper bound for the nth prime.
  ## https://math.stackexchange.com/questions/1270814/bounds-for-n-th-prime
  def self.estimate(n)
    n * (log(n) + log(log(n)))
  end

  def self.sieve(limit)
    ## Complete the set of @primes up to limit.
    unknowns = ((@primes.last + 2)..limit).step(2).to_a
    ## First sieve out all the known @primes
    @primes[2..-1].each do |p|
      unknowns.each_with_index do |u, i|
        unknowns.delete_at(i) if (u % p).zero?
      end
    end
    ## Then the remianing unkowns.
    last_prime = unknowns.shift
    until last_prime < Math.sqrt(limit)
      last_prime = unknowns.shift
      unknowns.each_index do |i|
        unknowns.delete_at(i) if (unknowns[i] % last_prime).zero?
      end
      @primes << last_prime
    end
    @primes.concat(unknowns)
  end
  ## For some strange reason, I can't set this method to private:
  ## gives me a "no method error" when nth is called.
  ## private_class_method :sundarm
end
