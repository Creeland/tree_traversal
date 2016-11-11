class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

end

# Grandparent
ancestor = Tree.new(1, [first_parent, second_parent])

# Parents
first_parent = Tree.new(2, [first_child, second_child])
second_parent Tree.new(3, [third_child, fourth_child])

# Children
first_child = Tree.new(4, [])
second_child = Tree.new(5, [])
third_child = Tree.new(6, [])
fourth_child = Tree.new(7, [])

def depth_first(node)
  
  depth_first(node)
end