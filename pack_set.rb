require './pack'

class PackSet
  def initialize
    @packs = []
  end

  def add book
    add_pack if empty? or in_all_packs? book
    @packs.sort.each do |pack|
      next if pack.include? book
      break if pack.add book
    end
  end

  def price
    @packs.map(&:price).reduce(:+) || 0
  end

  def add_pack
    @packs.push Pack.new
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
end
