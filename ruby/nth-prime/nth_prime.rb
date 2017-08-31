##  coding: utf-8

include Math
##  Object: Prime, methods: nth
class Prime
  ## There is no "zeroth prime" but ignoring that to get rid of
  ## troublesome array offsets.
  @primes = [0, 2]#, 3, 5, 7, 11, 13, 17, 19, 23]

  def self.nth(n)
    if @primes[n]
      @primes[n]
    else
      prime(n)
    end
  end


  ## updates the primes array to the nth prime and returns it.
  def self.prime(n)
    private
   target = estimate(n)
   @primes = [0, 2, 3, 5 , 7, 11, 13, 17, 19, 23]
    #sieve(target)
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
  end
end
