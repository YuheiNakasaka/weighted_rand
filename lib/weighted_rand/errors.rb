# frozen_string_literal: true

module WeightedRand
  class WrongArgumentError < StandardError
    def initialize(msg = 'The argument is not a Hash')
      super
    end
  end
end