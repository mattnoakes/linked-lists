require 'pry-byebug'
class LinkedList
  attr_accessor :head, :tail, :next_node, :size
  def initialize(head = nil, tail = nil)
    @head = head
    @tail = tail
    @size = 0
  end

  # adds a new node containing value to the end of the list
  def append(value)
    if @head == nil
      @head = Node.new(value)
    else
      node = @head
      until node.next_node == nil
        node = node.next_node
      end
      node.next_node = Node.new(value)
    end
    @size += 1
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    @head = Node.new(value, @head)
    @size += 1
  end

  # returns the total number of nodes in the list
  def size
    @size
  end

  # returns the first node in the list
  def head
    @head
  end

  # returns the last node in the list
  def tail
    node = @head
      until node.next_node == nil
        node = node.next_node
      end
    @tail = node
  end
end

class Node
  attr_reader :data
  attr_accessor :next_node
  def initialize(value = nil, next_node = nil)
    @data = value
    @next_node = next_node
  end
end

# binding.pry

list = LinkedList.new
list.append(5)
list.prepend(10)
list.prepend(15)
list.append(20)
list.append(30)

p list

puts list.size
puts list.head
puts list.tail
