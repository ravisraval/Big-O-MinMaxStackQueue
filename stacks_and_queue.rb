class MyQueue



  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.dup.shift
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

end

class MyStack


  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(el)
    @store.push(el)
  end

  def peek
    @store.dup.pop
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

end

class StackQueue

  def initialize
    @input_stack = MyStack.new
    @output_stack = MyStack.new
  end

  def enqueue(el)
    @input_stack.push(el)
  end

  def dequeue
    @input_stack.size.times { @output_stack.push(@input_stack.pop)}
    el_to_return = @output_stack.pop
    @output_stack.size.times { @input_stack.push(@output_stack.pop)}
    el_to_return
  end

  def size
    @input_stack.size
  end

  def empty?
    @input_stack.empty?
  end

end

class MinMaxStack
  def initialize
    @stack = MyStack.new
  end

  def size
    @stack.size
  end

  def empty?
    @stack.empty?
  end

  def pop
    @stack.pop[:value]
  end

  def max
    @stack.peek[:max]
  end

  def min
    @stack.peek[:min]
  end

  def peek
    @stack.peek[:value]
  end

  def push(el)
    @stack.push({max: find_max(el), min: find_min(el), value: el})
  end


  private
  def find_max(el)
    return el if empty?
    [max, el].max
  end

  def find_min(el)
    return el if empty?
    [min, el].min
  end
end

class MinMaxStackQueue

  def initialize
    @input_stack = MinMaxStack.new
    @output_stack = MinMaxStack.new
  end

  def max
    @input_stack.max
  end

  def min
    @input_stack.min
  end

  def enqueue(el)
    @input_stack.push(el)
  end

  def dequeue
    @input_stack.size.times { @output_stack.push(@input_stack.pop)}
    el_to_return = @output_stack.pop
    @output_stack.size.times { @input_stack.push(@output_stack.pop)}
    el_to_return
  end

  def size
    @input_stack.size
  end

  def empty?
    @input_stack.empty?
  end
end
