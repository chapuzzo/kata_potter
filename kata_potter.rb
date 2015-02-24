# Kata Potter
require 'awesome_print'
require './basket'

def basket books
  basket = Basket.new books.uniq.count
  books.each do |book|
    basket.add book
  end
  basket.price.round(2)
end
