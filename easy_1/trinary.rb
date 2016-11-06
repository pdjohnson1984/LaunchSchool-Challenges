class Trinary
  BASE = 3
  INVALID_OCTAL = /\D|[3-9]/

  attr_reader :num

  def initialize(num)
    @num = num
  end

  def to_decimal
    num =~ INVALID_OCTAL ? 0 : calculate
  end

  private

  def calculate
    accumulator = 0
    num.reverse.each_char.with_index do |num, idx|
      accumulator += num.to_i * (BASE ** idx)
    end
    accumulator
  end
end
