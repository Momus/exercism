##  coding: utf-8

include Math
##  Object: Prime, methods: nth
class Prime
  ## There is no "zeroth prime" but ignoring that to get rid of
  ## troublesome array offsets.
  @primes = [0, 2] # , 3, 5, 7, 11, 13, 17, 19, 23]

  def self.nth(n)
    @primes[n] ||= prime(n)
  end

  def self.prime(n)
    private
    sieve(estimate(n))
    @primes[n]
  end

  ## Prime Number Therom provides an upper bound for the nth prime.
  ## https://math.stackexchange.com/questions/1270814/bounds-for-n-th-prime
  def self.estimate(n)
    private
    n * (log(n) + log(log(n)))
  end

  def self.sieve(limit)
    private
    limit
  end
end
