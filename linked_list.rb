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
      @tail = @head
      @head = new_node
    end
  end
end

test_list = List.new
test_list.append('test1')
test_list.append('test2')
test_list.append('test3')

test_list.prepend('test4')
p test_list
=begin 
p test_list.size
puts test.contains?('test5')
puts test.contains?('test3')
p test.find('test2')
p test.find('test5')
test.pop
test.append('post-pop')
test.prepend('prepend-test')
test.append('append-test')
puts test
p test.at(5)
puts test
test.insert_at(1, 'insert_test')
puts test
test.insert_at(0, 'insert_head_test')
puts test
test.remove_at(1)
puts test
test.remove_at(0)
puts test 
=end