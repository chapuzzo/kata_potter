require './pack_set'

class Basket

  def initialize sizes = 0
    @pack_sets = []
    (1..sizes).each do |size|
      @pack_sets << PackSet.new(size)
    end
  end

  def add book
    @pack_sets.each do |ps|
      ps.add book
    end
  end

  def price
    return 0 if @pack_sets.empty?
    @pack_sets.sort.first.price
  end

end
