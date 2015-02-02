# Kata Potter
BOOK_PRICE = 8

def basket books
  if books.uniq.count == books.count
    return 15.2 if books.count == 2
  end
  books.count * BOOK_PRICE
end

