class Pack
  def initialize
    @elements = []
  end

  def price
    [0, 8, 15.2, 21.6, 25.6, 30][@elements.count]
  end

  def empty?
    @elements.empty?
  end

  def include? book
    @elements.include?(book)
  end

  def add book
    @elements.push book
  end

  def <=> other
    self.price <=> other.price
  end

  def to_s
    @elements.join ' '
  end
end
