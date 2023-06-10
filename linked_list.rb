# frozen_string_literal: true

class Node
  attr_accessor :data, :next_node

  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
  end
end

class List
  attr_accessor :name, :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def prepend(value)
    if @head.nil?
      new_node = Node.new(value)
      @head = new_node
      @tail = new_node
    else
      new_node = Node.new(value, @head)
      @head = new_node

    end
  end

  def size
    i = 0
    current_node = @head
    puts @head
    until current_node.nil?
      i += 1
      current_node = current_node.next_node
    end
    puts "Depth of #{i}"
    i
  end

  def contains?(target)
    current_node = @head
    loop do
      if current_node.data == target
        return true
      elsif current_node.next_node.nil?
        return false
      else
        current_node = current_node.next_node
      end
    end
  end

  def at(index = 0)
    raise 'No nodes' if @head.nil?

    current_node = @head
    loop do
      return current_node if index.zero?
      raise 'Index does not exist' if current_node.next_node.nil? && index != 0

      current_node = current_node.next_node
      index -= 1
    end
  end

  def pop
    raise 'No nodes' if @head.nil?

    current_node = @head
    current_node = current_node.next_node until current_node.next_node == @tail
    current_node.next_node = nil
    @tail = current_node
  end

  def find(data_value)
    raise 'No nodes' if @head.nil?

    current_node = @head
    loop do
      return current_node if current_node.data == data_value
      raise 'Value does not exist' if current_node.next_node.nil?

      current_node = current_node.next_node
    end
  end

  def to_s
    raise 'No nodes' if @head.nil?

    current_node = @head
    string = '('
    node_array = []
    loop do
      break if current_node.next_node.nil?

      node_array << current_node.data
      current_node = current_node.next_node
    end
    string += node_array.join(') -> (')
    string << ') -> nil'
    string
  end

  def insert_at; end

  def remove_at; end
end

test_list = List.new
test_list.append('test1')
test_list.append('test2')
test_list.append('test3')

test_list.prepend('test4')
p test_list

p test_list.size

puts test_list.contains?('test5')
puts test_list.contains?('test3')

p test_list.head.data
p test_list.tail.data

p test_list.at(0)
p test_list.at(2)
# p test_list.at(5) # * Negative test case
# p test_list.at(12) # * Negative test case
puts "Create new list"
test_list = List.new
test_list.append('test1')
test_list.append('test2')
test_list.append('test3')
test_list.prepend('test4')
p test_list

test_list.append('pop me')
p test_list
test_list.pop
p test_list.contains?('pop me')

p test_list.find('test2')
#p test_list.find('test5') # * Negative test case

p test_list.to_s

