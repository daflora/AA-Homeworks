class Stack

    def initialize
      @ivar = Array.new
      # create ivar to store stack here!
    end

    def add(el)
      @ivar << el
      # adds an element to the stack
    end

    def remove
      @ivar.pop
      # removes one element from the stack
    end

    def show
      @ivar.dup
      # return a copy of the stack
    end
end

class Queue
  def initialize
    @queue = Array.new
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

class Map
  # attr_reader :storage

  def initialize
    @storage = Array.new
  end

  def assign(key,value)
    result = @storage.index {|el| el[0] == key}
    if result
      @storage[result][1] = value
    else
      @storage << [key, value]
    end
    [key,value]

  end

  def lookup(key)
    result = @storage.select {|el| el[0] == key}
    index = @storage.index(result.flatten)
    @storage[index][1]
  end

  def remove(key)
    @storage.delete(key)
  end

  def show
    @storage.dup
  end

end

a = Stack.new
p a.add(4)
p a.add(6)
p a.add(9)
p a.show
p a.remove
p a.show

p b = Queue.new
p b.enqueue(1)
p b.enqueue(3)
p b.enqueue(5)
p b.show
p b.dequeue
p b.show

p c = Map.new
p c.assign(0,45)
p c.assign(1,"parrot")
p c.assign(6, 78)
p c.show
p c.assign(0,"dogs")
p c.show
p c.remove(6)
p c.show
