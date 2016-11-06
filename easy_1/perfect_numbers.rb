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
      @sum += num if @number % num == 0
    end

    #for notes. I like this better using reduce than iterrating with
    # a sum instance variable
    # factors = (1...number).select { |num| number % num == 0 }
    #
    # result = factors.reduce(:+)
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
