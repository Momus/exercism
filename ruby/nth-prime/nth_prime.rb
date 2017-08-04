##  coding: utf-8

include Math
##  Object: Prime, methods: nth
class Prime
  ## There is no "zeroth prime" but ignoring that to get rid of
  ## troublesome array offsets.
  @primes = [0, 2, 3, 5, 7, 11, 13, 17, 19, 23]
  class << self
    def nth(n)
      @primes[n] ||= prime(n)
    end

    ## Returns the nth prime, and updates the prime table.
    def prime(n)
      estimate(n).eratosthenes
      @primes[n]
    end

    ## The Prime Number Therom can provide an upper bound for the nth
    ## prime.
    ## https://math.stackexchange.com/questions/1270814/bounds-for-n-th-prime
    def estimate(n)
      n * (log(n) + log(log(n)))
    end

    def eratosthenes(limit)
      @primes = [limit]
    end
    ## For some strange reason, I can't set this method to private:
    ## gives me a "no method error" when nth is called.
    ## private_class_method :sundarm
  end
end
