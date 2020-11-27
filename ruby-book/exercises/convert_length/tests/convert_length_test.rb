require 'minitest/autorun'
require_relative '../lib/convert_length'

class ConvertLengthTest < Minitest::Test
  def test_test_convert_length
    assert_equal 39.37, convert_length(1, from: :m, to: :in)
    assert_equal 3.28, convert_length(1, from: :m, to: :f)
    assert_equal 3.05, convert_length(10, from: :f, to: :m)
  end
end