

def sluggish(arr)
  answer = ""
  i = 0
  while i < arr.length
    j = 0
    while j < arr.length
      if i!=j
        answer = arr[j] if arr[j].length > arr[i].length && arr[j].length > answer.length
      end
      j += 1
    end
    i += 1
  end
  answer
end

def dominant(arr)
  return arr if arr.length <= 0
  answer = arr[0]
  prc = Proc.new {|x,y| x.length <=> y.length}
  less_than = arr.drop(1).select {|el| prc.call(el,answer) < 0}
  greater_than = arr.drop(1).select {|el| prc.call(el,answer) >= 0}
  fish=dominant(less_than)+[answer]+dominant(greater_than)
end

def clever(arr)
  longest= arr[0]
  arr.each do |el|
    longest = el if el.length > longest.length
  end
  longest
end

def slow_dance(direction, tiles_array = tiles_array)
  tiles_array = ["up","right-up","right","right-down","down","left-down","left","left-up"]
  tiles_array.each_index do |dir|
    return dir if tiles_array[dir] == direction
  end
end

def quick_dance(direction, new_tiles_data_structure)
  new_tiles_data_structure[direction.to_sym]
end

new_tiles_data_structure = { up:0, right_up: 1, right:2, right_down:3, down:4,
  down_left: 5, left: 6, left_up: 7}


tiles_array = ["up","right-up","right","right-down","down","left-down","left","left-up"]
a = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
#=> "fiiiissshhhhhh"

p sluggish(a)
p dominant(a).last
p clever(a)
p slow_dance("up")
p quick_dance("up", new_tiles_data_structure)
