## Binary Search Tree Class
class Bst
  attr_reader :data, :right, :left

  def initialize(data)
    @data = data
  end

  def insert(value)
    if value > @data
      @right ? @right.insert(value) : @right = Bst.new(value)
    else
      @left ? @left.insert(value) : @left = Bst.new(value)
    end
  end

  def to_a(acc = [])
    @left.to_a(acc) if @left
    acc << @data
    @right.to_a(acc) if @right
    acc
  end

  def each(&block)
    to_a.each(&block)
  end
end
