# frozen_string_literal: true

module WeightedRand
  # BinarySearch
  # https://qiita.com/kaityo256/items/64c12bb8c8946d7f03c6
  # 
  # Initialization: O(N)
  # Search: O(log(N))
  # Update: O(N)
  class BinarySearch
    # Initialize a new WeightedRand object
    # 
    # @param [Hash] items the weighted item(eg. {'a' => 2, 'b' => 3, 'c' => 5})
    # @return [WeightedRand] a new WeightedRand object
    def initialize(items)
      raise WrongArgumentError unless items.is_a?(Hash)

      @running_total = 0
      @items = []
      items.each do |k, v|
        next if v == 0
        @running_total += v
        @items << [k, @running_total]
      end
    end

    # Return a random item
    # 
    # @return [Object] a random item
    def sample
      return nil if @items.empty?

      rnd = rand(@running_total)
      i = 0
      j = @items.length - 1
      while i < j
        h = (i + j) >> 1
        if @items[h][1] <= rnd
          i = h + 1
        else
          j = h
        end
      end
      @items[i][0]
    end
  end
end