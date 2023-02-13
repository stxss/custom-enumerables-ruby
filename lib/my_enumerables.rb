module Enumerable
  # Your code goes here

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

Array.new.my_each
