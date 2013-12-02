require 'pry'

# this isn't a binary tree
# so children get inserted at random 
# rather than left or right
class TreeNode

  attr_accessor :value, :children

  def initialize(value)
  	@value = value
  	@children = []
  end

  # use array methods to insert
  def addChild(node)
  	@children.push node
  end

  def leaf?
  	children.empty?
  end

  def count
  	if self.leaf?
  	  1
  	else
  	  @children.reduce(1) do |sum, child|
  	  	sum += child.count
  	  	sum
  	  end
      
      # this is the same thing w/out reduce
  	  # @children.each do |child|
  	  # 	sum +=  child.count
  	  # end
  	  # sum
  	end
  end

  def sum
  	if self.leaf? 
  	  self.value
  	else
  	  @children.reduce(self.value) do |sum, child|
  	    sum += child.sum # recursive call
  	    sum
  	  end
    end
  end

  # return node with highest value
  def max
  	maxNode = self

  	@children.each do |subtree|
  	  if subtree.max.value > maxNode.value
  	  	maxNode = subtree.max
  	  end

  	end
  	maxNode
  end

  # pretty much the same as max but inverse
  def min
        minNode = self

    @children.each do |subtree|
      if subtree.min.value < minNode.value
        minNode = subtree.min
      end
    end
    minNode
  end

end

tree = TreeNode.new(0)
tree.addChild TreeNode.new(1)
tree.addChild TreeNode.new(2)

node1 = tree.children[0]
node2 = tree.children[1]

node1.addChild TreeNode.new(3)
node1.addChild TreeNode.new(4)

node2.addChild TreeNode.new(5)
node2.addChild TreeNode.new(6)

# test it out
puts tree.children[0].children[0].value # 3
puts tree.children[1].children[1].value # 6
puts "here's the count: " + tree.count.to_s
puts "here's the sum: " + tree.sum.to_s
puts "here's the max value: " + tree.max.value.to_s
puts "here's the min value: " + tree.min.value.to_s


binding.pry