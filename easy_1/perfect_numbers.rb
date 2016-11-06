class PerfectNumber
  def self.classify(num)
    raise RuntimeError, 'has to be a positive integer' unless num >= 0
    @sum = 0
    @number = num
    calculate_sum
    perfect_num
  end

  private

  def self.calculate_sum
    (1..@number - 1).each do |num|
      if @number % num == 0
        @sum += num
      end
    end
  end

  def self.perfect_num
    if @sum == @number
      'perfect'
    elsif @sum < @number
      'deficient'
    else
      'abundant'
    end
  end
end
