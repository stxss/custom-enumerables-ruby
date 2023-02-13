module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    idx = 0
    for i in self
      yield i, idx
      idx += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    results = []
    my_each { |i| results << i if yield i }
    results
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?

    results = []
    my_each { |i| results << i if yield i }
    results.length == self.length
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?

    results = []
    my_each { |i| results << i if yield i }
    results.empty? ? true : false
  end

  def my_count
    return size unless block_given?

    results = []
    my_each { |i| results << i if yield i }
    results.size
  end

  def my_map
    results = []
    my_each { |i| results << (yield i) }
    results
  end

  def my_inject(initial_value = nil)
    sum = initial_value.nil? ? self[0] : initial_value
    my_each { |num| sum = yield(sum, num) }
    sum
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  include Enumerable
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    for i in self
      yield i
    end
  end
end
