require "test/unit"
require_relative "./kata_potter"

class TestPotter < Test::Unit::TestCase


  def test_empty_basket_result_0
    assert_equal 0, basket([])
  end

  def test_single_book_costs_8
    assert_equal 8, basket([1])
    assert_equal 8, basket([5])
  end

  def test_to_equal_books_cost_16
    assert_equal 16, basket([1,1])
    assert_equal 16, basket([5,5])
  end

  def test_two_different_books_get_5_percent_discount
    assert_equal 15.2, basket([1,2])
    assert_equal 15.2, basket([4,5])
  end

end
