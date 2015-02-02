require "test/unit"
require_relative "./kata_potter"

class TestPotter < Test::Unit::TestCase


  def test_empty_basket_result_0
    assert_equal 0, basket([])
  end

end
