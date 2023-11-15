module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    my_each do |element|
      yield(element,index)
      index+=1
    end
    self
  end

  def my_select
    return_array = []
    my_each do |element|
      return_array << element if yield(element)
    end
    return_array
  end

  def my_all?
    return_value = true
    my_each do |element|
      if !yield(element)
        return false
      end
    end
    return_value
  end

  def my_any?
    my_each do |element|
      if yield(element)
        return true
      end
    end
    false
  end

  def my_none?
    my_each do |element|
      if yield(element)
        return false
      end
    end
    true
  end

  def my_count
    counter = 0
    my_each do |element|
      if yield(element)
        counter += 1
      end
    end
    counter
  end

  def my_map
    return_array = []
    my_each do |element|
      return_array << yield(element)
    end
    return_array
  end

  def my_inject(initial = nil)
    accumulator = initial
    skip_first = false

    if initial.nil?
      accumulator = self[0]
      skip_first = true
    end

    my_each_with_index do |item, index|
      next if skip_first && index
      accumulator = yield(accumulator, item)
    end

    accumulator
  end


end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here

  def my_each
    for x in 0..(self.length-1)
      yield(self[x])
    end
    return self
  end

end
