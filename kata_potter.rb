# Kata Potter
BOOK_PRICE = 8

def available_discount? number_of_books, number_of_different_books
  number_of_books == number_of_different_books && number_of_books > 1
end

def pack_price size
  [15.2, 21.6, 25.6, 30][size - 2]
end

def basket books
  number_of_books = books.count
  number_of_kinds = books.uniq.count

  return pack_price number_of_books if available_discount? number_of_books, number_of_kinds

  number_of_books * BOOK_PRICE
end

