# Kata Potter
require 'awesome_print'
require './pack_set'

def basket books
  ps = PackSet.new
  books.sort.each do |book|
    ps.add book
  end
  ps.price.round(2)
end
