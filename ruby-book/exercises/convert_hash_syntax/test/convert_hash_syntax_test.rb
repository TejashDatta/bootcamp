require 'minitest/autorun'
require_relative '../lib/convert_hash_syntax'

class ConvertHashSyntaxTest < Minitest::Test
  def test_convert_hash_syntax
    old_syntax = <<~HASH
      {
        :name => 'Alice',
        :age  =>  22,
        :gender=>:male
      }
    HASH
    expected = <<~HASH
      {
        name: 'Alice',
        age: 22,
        gender: :male
      }
    HASH
    assert_equal expected, convert_hash_syntax(old_syntax)
  end
end
