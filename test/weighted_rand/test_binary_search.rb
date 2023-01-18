# frozen_string_literal: true

require 'test_helper'

class TestBinarySearch < Minitest::Test
  def test_it_return_random_value
    weighted_hash = { 'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5 }
    weighted_rand = WeightedRand::BinarySearch.new(weighted_hash)
    assert ['a', 'b', 'c', 'd', 'e'].include?(weighted_rand.sample)
  end

  def test_it_respects_weights
    weighted_hash = { 'a' => 100, 'b' => 2, 'c' => 1 }
    weighted_rand = WeightedRand::BinarySearch.new(weighted_hash)
    result = {}
    1000.times do
      k = weighted_rand.sample
      result[k] ||= 0
      result[k] += 1
    end
    assert result.keys.sort[0] == 'a'
  end

  def test_it_return_value_even_if_there_is_only_one_item
    weighted_hash = { 'a' => 10 }
    weighted_rand = WeightedRand::BinarySearch.new(weighted_hash)
    assert weighted_rand.sample == 'a'
  end

  def test_it_return_nil_if_there_are_no_items_to_return
    weighted_hash = { 'a' => 0 }
    weighted_rand = WeightedRand::BinarySearch.new(weighted_hash)
    assert weighted_rand.sample.nil?
  end

  def test_it_return_random_value_except_for_the_value_weight_is_zero
    weighted_hash = { 'a' => 2, 'b' => 0, 'c' => 0 }
    weighted_rand = WeightedRand::BinarySearch.new(weighted_hash)
    assert weighted_rand.sample == 'a'
  end

  def test_it_raise_error_if_invalid_argument_is_passed
    assert_raises(WeightedRand::WrongArgumentError) { WeightedRand::BinarySearch.new([1, 2, 3]) }
  end
end