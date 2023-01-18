# frozen_string_literal: true

module WeightedRand
  # Linear
  # 
  # Initialization: O(N)
  # Search: O(N)
  # Update: O(N)
  class Linear
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
      @items.each do |k, v|
        if v > rnd
          return k
        end
      end
    end
  end
end