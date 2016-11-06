class Sieve
  attr_reader :range

  def initialize(last_num)
    @range = (2..last_num).to_a
  end

  def primes
    range.each do |prime|
      range.reject! { |num| (num != prime) && (num % prime == 0) }
    end
    range
  end

end
