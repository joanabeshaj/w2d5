require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    # num = num.hash
    unless self.include?(num)
      resize! if self.count + 1 >= num_buckets
      self[num] << num
      @count += 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end


  def remove(num)
    self[num].delete(num)
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_els = @store.flatten
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    old_els.each do |el|
      self.insert(el)
    end
  end
end
