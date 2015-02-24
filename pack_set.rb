require './pack'

class PackSet
  def initialize size
    @packs = []
    @size = size
  end

  def add book
    add_pack if empty? or in_all_packs? book or all_packs_full?
    @packs.each do |pack|
      next if pack.include? book or pack.full?
      break if pack.add book
    end
  end

  def price
    @packs.map(&:price).reduce(:+) || 0
  end

  def add_pack
    @packs.push Pack.new @size
  end

  def empty?
    @packs.empty?
  end

  def in_all_packs? book
    @packs.all?{ |pack|
      pack.include? book
    }
  end

  def all_packs_full?
    @packs.all?{ |pack|
      pack.full?
    }
  end

  def to_s
    @packs.map(&:to_s).join "\n"
  end

  def <=> other
    self.price <=> other.price
  end
end
