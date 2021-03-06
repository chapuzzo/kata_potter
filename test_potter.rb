require "test/unit"
require_relative "./kata_potter"

class TestPotter < Test::Unit::TestCase
  self.test_order = :defined

  def test_empty_basket_result_0
    assert_equal 0, basket([])
  end

  def test_single_book_costs_8
    assert_equal 8, basket([1])
    assert_equal 8, basket([5])
  end

  def test_two_equal_books_cost_16
    assert_equal 16, basket([1,1])
    assert_equal 16, basket([5,5])
  end

  def test_two_different_books_get_5_percent_discount
    assert_equal 15.2, basket([1,2])
    assert_equal 15.2, basket([4,5])
  end

  def test_three_equal_books_cost_24
    assert_equal 24, basket([1,1,1])
    assert_equal 24, basket([5,5,5])
  end

  def test_three_different_books_get_10_percent_discount
    assert_equal 21.6, basket([1,2,4])
    assert_equal 21.6, basket([4,5,2])
  end

  def test_four_equal_books_cost_32
    assert_equal 32, basket([2,2,2,2])
    assert_equal 32, basket([3,3,3,3])
  end

  def test_four_different_books_get_20_percent_discount
    assert_equal 25.6, basket([1,2,3,4])
    assert_equal 25.6, basket([2,4,1,5])
  end

  def test_five_equal_books_cost_40
    assert_equal 40, basket([4,4,4,4,4])
    assert_equal 40, basket([3,3,3,3,3])
  end

  def test_five_different_books_get_25_percent_discount
    assert_equal 30, basket([1,2,3,4,5])
    assert_equal 30, basket([2,4,1,5,3])
  end

  def test_best_available_discount_is_applied
    assert_equal 51.2, basket([1,1,2,2,3,3,4,5])
    assert_equal 51.2, basket([5,1,1,2,2,3,3,4])
  end

  def test_ultimate
    assert_in_epsilon 76.8, basket([1,2,3,4,1,2,5,4,1,2,3,4]), 0.0001
    assert_equal 76.8, basket([1,2,3,4,1,2,5,4,1,2,3,4])
  end

  def test_this_shoudn_t_be_a_test
    book_ids = (1..5).to_a
    pack_prices = [0, 8, 15.2, 21.6, 25.6, 30]
    basket_items = []
    basket_price = 0

    (1..9).each do
      current_baset = book_ids.sample(rand(6))
      basket_items += current_baset
      basket_price += pack_prices[current_baset.count]
    end

    assert_operator basket_price, :>=, basket(basket_items)
  end

end
