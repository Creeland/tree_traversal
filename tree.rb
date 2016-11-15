require 'byebug'

class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

end

# Children
first_child = Tree.new(4, [])
second_child = Tree.new(5, [])
third_child = Tree.new(6, [])
fourth_child = Tree.new(7, [])

# Parents
first_parent = Tree.new(2, [first_child, second_child])
second_parent = Tree.new(3, [third_child, fourth_child])

# Grandparent
ancestor = Tree.new(1, [first_parent, second_parent])

def depth_first(node, target, previous_nodes=[], child_count=0) 
  return target if !node.nil? && node.payload == target 
  previous_nodes.push(node) if node != previous_nodes.last

  if node.children[child_count].nil?
    previous_nodes.pop 
    child_count += 1
    return target if depth_first(previous_nodes.last, target, previous_nodes, child_count) == target
  end

  node = node.children[child_count]
  depth_first(node, target, previous_nodes)
end
