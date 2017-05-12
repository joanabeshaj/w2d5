require 'byebug'
class Fixnum

end

class Array
  def hash
    sum = 0
    self.each_with_index do |el, i|
      #debugger
      sum = (el.hash + i.hash) ^ sum
    end
    sum
  end
  #debugger
end

p [1,2].hash

p [1,2].hash

class String
  def hash
    code = self.chars.map {|char| char.ord }.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort.hash
  end
end
