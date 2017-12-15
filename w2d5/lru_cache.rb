class LRUCache
   def initialize(size)
     @size = size
     @cache = Array.new
   end

   def count
     @cache.length
     # returns number of elements currently in cache
   end

   def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
      #resort
    elsif @cache.count == @size
      @cache.shift
    end
    @cache.push(el)
   end

   def show
    #  @cache.each do |arr|
    #    print arr
    #  end
    p @cache
     # shows the items in the cache, with the LRU item first
   end

   private

  #  def remove(el)
  #    idx = @cache.find_index(el)
  #    @cache[idx] = nil
  #  end
  # #
  # def resort
  #     (0...@size).each do |idx|
  #       next unless @cache[idx] == nil
  #       @cache[idx] = @cache[idx+1]
  #       @cache[idx+1] = nil
  #     end
  # end # helper methods go here!

 end


 johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
