##  coding: utf-8

include Math
##  Object: Prime, methods: nth
class Prime
  @primes = [2, 3, 5, 7] # , 11, 13, 17, 19, 23, 29]
  ##                      [ t   t   t   t   t   t  t]
  ##  i:   0     1     2    3    4    5    6
  ##  val: 8     9    10    11   12   13   14
  ##  2   [f*    t    f*     t   f*   t    f*]
  ##  3   [f     f*   f      t   f    t    f ]
  ##  5   [f    f     f      t   f    t     f]
  ##                   5-- first "true" =

  ## Uselsess negatity made positive. nth(0) returns the last known
  ## prime. This is a feature.
  def self.nth(n)
    @primes[n.abs - 1] ||= sieve(n.abs)
  end

  ## Use the Prime Number Therom to find an upper bound for nth prime.
  ## https://math.stackexchange.com/questions/1270814/bounds-for-n-th-prime
  def self.estimate(n)
    private
    n * (log(n) + log(log(n)))
  end

  def self.sieve(n)
    private

    unknown_unkowns = Array.new((estimate(n + 1) # Next prime 4 safety
                                - @primes[-1]), true)
    ## Remove multiples of old primes from unknown_primes
    remove_known_primes(unknown_unkowns)
    ## Sieve out non-primes from unknown_primes
    ## Reduce unkown_primes to an array of prime numbers
    ## Add the array above to @primes
    @primes[n - 1]
  end

  def self.remove_known_primes(unknowns)
    private
    last_prime = @primes[-1]
    @primes.each do |p|
      unknowns.each_with_index do |unkn, i|
        unknowns[i] = false if unkn && ((last_prime + 1 + i) % p).zero?
      end
    end
    unknowns
  end
end
