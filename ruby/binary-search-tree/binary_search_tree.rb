## Binary Search Tree Class
class Bst
  attr_reader :left, :right, :data

  def initialize(data)
    self.data = data
  end

  def insert(value)
    if value > data
      right ? right.insert(value) : self.right = Bst.new(value)
    else
      left ? left.insert(value) : self.left = Bst.new(value)
    end
  end

  def to_a(acc = [])
    left.to_a(acc) if left
    acc << data
    right.to_a(acc) if right
    acc
  end

  def each(&block)
    to_a.each(&block)
  end

  protected

  attr_writer :left, :right, :data
end
