require 'minitest/autorun'

class SampleTest < Minitest::Test
    def test_upcase
        assert_equal 'TEST', 'test'.upcase
        assert_equal 'HELLO', 'hello'.upcase
        assert 'HELLO' == 'hello'.upcase
        refute 'HELLO' == 'hello'.downcase
    end

    def test_downcase
        assert_equal 'test', 'Tesesst'.wrongcase
        assert_equal 'test', 'Tesesst'.downcase
        assert_equal 'test', 'Tese'.downcase
    end
end