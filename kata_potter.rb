# Kata Potter
BOOK_PRICE = 8

def pack_price size
  # [0, 1, 0.95, 0.90, 0.80, 0.75].map do |current_discount|
  #   current_discount * BOOK_PRICE * size
  # end [size]
  [0, 8, 15.2, 21.6, 25.6, 30][size]
end

class PackSet
  def initialize
    @packs = []
  end

  def add book
    @packs.push Array.new if @packs.empty? or @packs.all?{|p| p.include?(book)}
    @packs.each do |pack|
      p @packs
      next if pack.include? book
      break if pack.push book
    end
    p @packs
  end

  def price
    @packs.map(&:length).collect{|length|
      pack_price length
    }.reduce(:+) || 0
  end
end

def basket books
  ps = PackSet.new
  books.each do |book|
    ps.add book
  end
  ps.price
end
