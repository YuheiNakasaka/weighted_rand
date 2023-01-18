# frozen_string_literal: true

module WeightedRand
  # WalkerAlias
  # https://qiita.com/kaityo256/items/64c12bb8c8946d7f03c6
  # https://qiita.com/kaityo256/items/1656597198cbfeb7328c
  # 
  # Initialization: O(N)
  # Search: O(1)
  # Update: O(N)
  class WalkerAlias
    # Initialize a new WeightedRand object
    # 
    # @param [Hash] items the weighted item(eg. {'a' => 2, 'b' => 3, 'c' => 5})
    # @return [WeightedRand] a new WeightedRand object
    def initialize(items)
      raise WrongArgumentError unless items.is_a?(Hash)

      @sum = 0
      @threshold = items.map do |k, v|
        @sum += v
        [k, v]
      end

      @ave = @sum / @threshold.length

      large = []
      small = []

      @threshold.length.times do |i|
        if @threshold[i][1] < @ave
          small.push(i)
        else
          large.push(i)
        end
      end

      @indexes = Array.new(@threshold.length, 0)

      while !small.empty? && !large.empty?
        j = small.pop
        k = large[-1]
        @indexes[j] = k
        @threshold[k][1] = @threshold[k][1] - (@ave - @threshold[j][1])
        if @threshold[k][1] <= @ave
          small << k
          large.pop
        end
      end
    end

    # Return a random item
    # 
    # @return [Object] a random item
    def sample
      return nil if @sum == 0

      i = rand(@indexes.length)
      if @threshold[i][1] > rand(@ave)
        return @threshold[i][0]
      else
        return @threshold[@indexes[i]][0]
      end
    end
  end
end