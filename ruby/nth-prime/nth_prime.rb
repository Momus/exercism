# Object: Prime, methods: nth
class Prime
  @primes = [0, 2, 3, 5, 7]
  class << self
    def nth(n)
      @primes[n] ||= prime(n)
    end

    ## Returns the nth prime, and updates the prime table.
    def prime(n)
      #Use the 

    end
    ## For some strange reason, I can't set this method to private:
    ## gives me a "no method error" when nth is called.
    ## private_class_method :sundarm
  end
end
