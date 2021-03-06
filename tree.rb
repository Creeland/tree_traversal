require 'byebug'

class Queue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end

  def empty?
    @queue.empty?
  end
end

class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

  def depth_first(target)
    return payload if target == payload
    # if !children.first.nil?
    #   search_result = children.first.depth_first(target)  
    #   return search_result if search_result
    # end
    # return children[1].depth_first(target) if !children[1].nil? 
  end

  def breadth_first(target, queue)
    return payload if target == payload
    children.each { |n| queue.enqueue(n) }
    check = queue.dequeue
    check = nil_cycle(check, queue) if check.nil?
    return check.breadth_first(target, queue) if check
  end

  def nil_cycle(check, queue)
    while check.nil? do
      check = queue.dequeue
      return check if check
      return if queue.empty?
    end
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

# ancestor.depth_first(5)

def depth_first(node, target) 
  return if node.nil?
  return node.payload if target == node.payload
  search_result = depth_first(node.children.first, target)
  return search_result if search_result
  return depth_first(node.children[1], target)
end



def breadth_first(node, target, queue) 
end



