class SumOfMultiples
  attr_reader :numbers

  def initialize(*nums)
    @numbers = nums
  end

  def self.to(up_to, multiples = [3, 5])
    (0...up_to).select do |number|
       multiples.any? { |multiple| number % multiple == 0 }
     end.reduce(:+)
  end

  def to(up_to)
    self.class.to(up_to, @numbers)
  end
end
